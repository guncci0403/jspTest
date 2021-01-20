package kr.or.ddit.util;

import static org.junit.Assert.assertEquals;

import java.util.UUID;

import org.junit.Test;

public class FileUtilTest {

	@Test
	public void getFileNameTest() {
		/***Given***/
		
		String contentDisposition = "form-data; name=\"file\"; filename=\"brown.png\"";
		/***When***/
		
		String filename = FileUtil.getFileName(contentDisposition); 
		
		/***Then***/
		assertEquals("brown.png", filename);
	}
	@Test
	public void getFileNameFailTest() {
		/***Given***/
		
		String contentDisposition = "form-data; name=\"file\"";
		/***When***/
		
		String filename = FileUtil.getFileName(contentDisposition); 
		
		/***Then***/
		assertEquals("", filename);
	}
	
	@Test
	public void getFileExtensionTest() {
		/***Given***/
		String filename = "brown.png";

		/***When***/
		String extension = FileUtil.getFileExtension(filename);

		/***Then***/
		assertEquals(".png", extension);
	}

	@Test
	public void getFileExtensionTest2() {
		/***Given***/
		String filename = "line.brown.png";
		
		/***When***/
		String extension = FileUtil.getFileExtension(filename);
		
		/***Then***/
		assertEquals(".png", extension);
	}

	@Test
	public void getFileExtensionTest3() {
		/***Given***/
		String filename = "brown";
		
		/***When***/
		String extension = FileUtil.getFileExtension(filename);
		
		/***Then***/
		assertEquals("", extension);
	}
	
	@Test
	public void test() {
		System.out.println(UUID.randomUUID().toString());
		//3e653ab5-1f8f-4cc3-8300-d89dac4136ab

	}
}
