package com.eric.crm.utils;

import java.util.UUID;

/**
 * 文件上传工具
 * @author eric
 *
 */
public class UploadUtils {
		
	public static String getUuidFileName(String fileName){
		int index = fileName.lastIndexOf(".");
		String extions = fileName.substring(index);
		return UUID.randomUUID().toString().replace("-", "") + extions;
	}
	
	public static String getPath(String uuidFileName){
		int hashCode = uuidFileName.hashCode();
		int dir1 = hashCode & 0xf;//最为一级目录
		int hashCode2 = hashCode >>> 4;
		int dir2 = hashCode2 & 0xf;
		return "/" + dir1 + "/" +dir2;
	}
	
	public static void main(String[] args){
		System.out.println(getUuidFileName("aa.txt"));
	}
}
