package com.sesoc.cl.drive;

public class Drive_File {
	
	private int num;
	private String original_filename;
	private String saved_filename;
	private int df_num;
	
	public Drive_File() {
	}

	public Drive_File(int num, String original_filename, String saved_filename, int df_num) {
		super();
		this.num = num;
		this.original_filename = original_filename;
		this.saved_filename = saved_filename;
		this.df_num = df_num;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getOriginal_filename() {
		return original_filename;
	}

	public void setOriginal_filename(String original_filename) {
		this.original_filename = original_filename;
	}

	public String getSaved_filename() {
		return saved_filename;
	}

	public void setSaved_filename(String saved_filename) {
		this.saved_filename = saved_filename;
	}

	public int getDf_num() {
		return df_num;
	}

	public void setDf_num(int df_num) {
		this.df_num = df_num;
	}

	@Override
	public String toString() {
		return "Drive_File [num=" + num + ", original_filename=" + original_filename + ", saved_filename="
				+ saved_filename + ", df_num=" + df_num + "]";
	}

}
