package sesoc.global.recorder;

import java.io.File;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	AudioCapture cap = new AudioCapture();
	private final String FILE_NAME = "data.";
	private File f;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	@RequestMapping("move")
	public String move(){
		//AudioServerManager asm = new AudioServerManager();
		//int result = asm.openServerSocket();
		System.out.println("서버소켓생성 완료");
		//cap.createStream();
		System.out.println("클라소켓생성 완료 웹페이지이동실행");
		return "webRecorderTestPage";
	}
	
	@RequestMapping("play")
	public void play(){
		System.out.println("플레이");
		//AudioServerManager am = new AudioServerManager();
		//am.saveWav();
	}
	
	@ResponseBody
	@RequestMapping("start")
	public String start(Model model){
		System.out.println("start버튼클릭");
		cap.captureAudio();
		System.out.println("오디오캡쳐메소드 실행");
		return "startRecorde";
	}
	
	@ResponseBody
	@RequestMapping("stop")
	public String stop(Model model){
		System.out.println("stop버튼클릭");
		//서버소켓 클로즈
		
		cap.stop();
		return "stopRecorde";
	}
	
	
	
}
