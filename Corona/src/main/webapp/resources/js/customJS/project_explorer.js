/**
 * ProjectExplorer 생성 및 이벤트 설정 javascript 
 */


var projectExplorerObject = [];

/**
 * 첫 기동 시 ProjectExplorer Tree를 구성
 * @param projectExplorer Project Explorer의 모든 내용을 담은 객체
 */
function initProjectExplorer(projectExplorer) {
	//Project Explorer의 내용을 담은 객체를 이용하여, Tree를 구성 할 source를 만듦
	var treeSource = makeTreeSource(projectExplorer);
// 	console.log(treeSource);
	
	//Tree 구성
	$("#tree").fancytree({
		//Tree의 뼈대를 구성
		source: treeSource,
		//더블클릭 하였을 때 이벤트 생성
		dblclick: function(event, data) {
// 			console.log(data.node.key);
// 			console.log(projectExplorerObject)
// 			console.log(data.node.folder);
			//더블클릭이 된 요소가 folder가 아닐 경우(file일 경우) 실행
			if(!data.node.folder) {
				//선택된 요소의 key값을 로딩
				var path = data.node.key;
				//Project Explorer의 내용을 담은 객체를 참색하여 같은 내용을 가진 부분을 탐색
				for(var i in projectExplorerObject) {
					for(var j in projectExplorerObject[i]) {
						if(projectExplorerObject[i][j].child.path == path) {
// 							console.log(projectExplorerObject[i][j].child.fileContent);
							//동일 부분에 해당하는 File 내용을 로딩
							var readCode = projectExplorerObject[i][j].child.fileContent;
							//새창에 File의 내용을 전달하기 위한 form 객체 로딩 후 File 내용 저장
							var codeForm = document.getElementById('codeForm');
							codeForm.code.value = readCode;
// 							console.log(codeForm.code.value);
							
							//새 창 생성
							var sourceCodeWindow = window.open('', 'SourceCode', 'width=600, height=500');
							//File의 내용을 새 창에 전달
							codeForm.target = 'SourceCode';
							codeForm.submit();
						}
					}
				}
			}
		}
	});
}

/**
 * Project의 구성 요소에 변화가 있을 때 Tree 업데이트
 */
function updateProjectExplorer(projectExplorer) {
	//Project Explorer의 내용을 담은 객체를 이용하여, Tree를 구성 할 source를 만듦
	var treeSource = makeTreeSource(projectExplorer);
	//새로 만든 source로 reload
	$.ui.fancytree.getTree("#tree").reload(treeSource);
}

/**
 * Tree를 구성 할 Source 생성
 */
function makeTreeSource(projectExplorer) {
	var treeSource = [];
	//Tree탐색을 위한 메소드 실행 (재귀실행)
	var treeSource = searchTree(projectExplorer, projectExplorer);
	return treeSource;
}

/**
 * ProjectExplorer의 구성요소를 담고 있는 객체를 이용하여 Tree구조를 탐색하는 재귀 메소드
 * Tree구성의 Source를 생성하여 반환 
 */
function searchTree(projectExplorer, projectObjects, treeSource, order, root) {
	//Tree구성 Source를 저장 할 임시 저장소
	var tempTreeSource;
	
	//treeSource가 없을 경우 (메소드의 첫 실행; root)
	if(!treeSource) {
		//source를 저장 할 배열 생성
		tempTreeSource = [];
	} 
	//treeSource가 있을 경우 (재귀 실행 중)
	else {
		//매개변수로 받은 source를 tempTreeSource에 저장
		tempTreeSource = treeSource;
	}
// 	console.log(projectObjects);
	
	//treeSource가 없을 경우 (메소드의 첫 실행; root)
	if(!treeSource) {
		//부모객체(ProjectExplorer객체)를 이용하여 자식객체(Project객체) 검색
		var searchResult = searchChild(projectExplorer);
		//자식객체(Project객체)들에 대해 각각 실행
		for(var index in searchResult) {
			var i = searchResult[index].path.lastIndexOf('/');
			//자식객체(Project객체)의 Tree를 구성 할 Source 생성 
			tempTreeSource.push({title: searchResult[index].path.substr(i+1), key: searchResult[index].path, folder: true, expanded: true});
			//자식객체(Project객체)의 자식객체를 검색하기 위해 재귀 메소드 실행
			searchTree(projectExplorer, searchResult[index], tempTreeSource, index, tempTreeSource[index]);
		}
	} 
	//treeSource가 있을 경우 (재귀 실행 중)
	else {
		//부모객체를 이용하여 자식객체 검색
		var searchResult = searchChild(projectExplorer, projectObjects);
// 		console.log(tempTreeSource);
// 		console.log(order);
// 		console.log(projectObjects);
// 		console.log(searchResult);
		//자식객체가 있을 경우 실행
		if(searchResult.length != 0){
			//TreeSource의 자식 객체를 저장 할 배열 생성
			tempTreeSource[order].children = [];
			//자식 객체를 저장 할 배열의 주소를 그 상위 주소에 덮어 씌움
			tempTreeSource = tempTreeSource[order].children;
			//자식 객체 들에 대해 각각 실행
			for(var index in searchResult) {
				//폴더(package)일 경우 실행
				if(searchResult[index].fileContent == null) {
					//부모 객체가 root에 해당 할 경우 실행
					if(projectObjects.path == root.title) {
						var i = searchResult[index].path.lastIndexOf('/');
						//자식객체의 Tree를 구성 할 Source 생성 (root의 자식으로) 
						root.children.push({title: searchResult[index].path.substr(i+1), key: searchResult[index].path, folder: true, expanded: true});
						//자식객체의 자식객체를 검색하기 위해 재귀 메소드 실행
						searchTree(projectExplorer, searchResult[index], root.children, index, root);
					} 
					//부모 객체가 root가 아닐 경우 실행
					else {
						var i = searchResult[index].path.lastIndexOf('/');
						//자식객체의 Tree를 구성 할 Source 생성 
						tempTreeSource.push({title: searchResult[index].path.substr(i+1), key: searchResult[index].path, folder: true, expanded: true});
						//자식객체의 자식객체를 검색하기 위해 재귀 메소드 실행
						searchTree(projectExplorer, searchResult[index], tempTreeSource, index, root);
					}
				} 
				//파일(java)일 경우 실행
				else {
					var i = searchResult[index].path.lastIndexOf('/');
					//자식객체의 Tree를 구성 할 Source 생성
					tempTreeSource.push({title: searchResult[index].path.substr(i+1), key: searchResult[index].path});
				}
			}
		}
	}
	return tempTreeSource;
}

/**
 * 부모 객체의 자식객체를 탐색 후 반환
 */
function searchChild(projectExplorer, parentObject) {
// 	console.log(parentObject);
	var childObject = [];
	//parentObject가 없을 경우 (Project Explorer 객체 일 경우)
	if(parentObject == null) {
		//parent객체가 없는 객체 탐색
		$.each(projectExplorer, function(index1, project) {
			$.each(project, function(index2, object) {
				if(object.parent == null) {
					//child객체를 return할 배열에 추가
					childObject.push(object.child);
				}
			});
		});
	}
	//parentObject가 있을 경우 (Project, Package, Java file 객체 일 경우)
	else if(parentObject != null) {
		//매개변수로 받은 parentObject와 같은 parent를 가진 객체 탐색
		$.each(projectExplorer, function(index1, project) {
			$.each(project, function(index2, object) {
				if(object.parent != null) {
// 					console.log(object.parent.path);
// 					console.log(parentObject.path);
					if(object.parent.path == parentObject.path) {
						//child객체를 return할 배열에 추가
						childObject.push(object.child);
					}
				}
			});
		});
	}
	return childObject;
}