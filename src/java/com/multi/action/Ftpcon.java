package com.multi.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.net.SocketException;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.apache.commons.net.ftp.FTP;
import org.apache.commons.net.ftp.FTPClient;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author ibn
 */
public class Ftpcon {

    FTPClient client = new FTPClient();
    FileInputStream fis = null;
    boolean status;

    public boolean upload(File filename) {
        try {
            client.connect("ftp.drivehq.com");
            client.login("drive05", "drive15");
            client.enterLocalPassiveMode();
            fis = new FileInputStream(filename);
            status = client.storeFile("kk"+filename.getName(), fis);
            client.logout();
            fis.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        if (status) {
            System.out.println("success");
            return true;
        } else {
            System.out.println("failed");
            return false;

        }

    }

    public boolean download(String remotefile, File local) {
        try {
            client.connect("ftp.drivehq.com");
            client.login("drive05", "drive15");
            client.enterLocalPassiveMode();
            client.setFileType(FTP.BINARY_FILE_TYPE);
        } catch (Exception e) {

        }

        return false;
    }
}
