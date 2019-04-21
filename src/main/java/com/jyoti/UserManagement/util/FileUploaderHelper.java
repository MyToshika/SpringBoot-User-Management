/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.abeer.digiteach.util;

import java.io.File;
import org.apache.commons.io.FilenameUtils;

/**
 *
 * @author Abeer
 */
public class FileUploaderHelper {
    
     public static boolean transferFileToServer(String uid, File uploadFile) {
        return false;
    }

    public static String getFileExtension(String filePath) {
        return FilenameUtils.getExtension(filePath);
    }
}