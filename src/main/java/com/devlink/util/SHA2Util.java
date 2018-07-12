package com.devlink.util;

import java.security.MessageDigest;

import java.security.NoSuchAlgorithmException;



public class SHA2Util {

    public static String calcHash(String str, String hashVariant) {

        String SHA = "";

        try {

            MessageDigest sh = MessageDigest.getInstance(hashVariant);

            sh.update(str.getBytes());

            byte byteData[] = sh.digest();

            StringBuffer sb = new StringBuffer();



            for (int i = 0; i < byteData.length; i++) {

                sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));

            }

            SHA = sb.toString();



        } catch (NoSuchAlgorithmException e) {

            e.printStackTrace();

            SHA = null;

        }

        return SHA;

    }



    public static String encrypt(String input) throws NoSuchAlgorithmException {

        return encrypt(input, "SHA-512");

    }



    public static String encrypt(String input, String hashVariant) throws NoSuchAlgorithmException {

        String output = "";



        StringBuffer sb = new StringBuffer();

        MessageDigest md = MessageDigest.getInstance(hashVariant);



        md.update(input.getBytes());

        byte[] msgb = md.digest();



        for (int i = 0; i < msgb.length; i++) {

            byte temp = msgb[i];

            String str = Integer.toHexString(temp & 0xFF);

            while (str.length() < 2) {

                str = "0" + str;

            }

            str = str.substring(str.length() - 2);

            sb.append(str);

        }



        output = sb.toString();



        return output;

    }

}