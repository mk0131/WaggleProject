package com.probee.waggle.model.controller;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Date;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;

import org.apache.tomcat.util.codec.binary.Base64;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ChatbotController {
	
	@GetMapping("/chatbot")
	public String Chatbot() {
		return "chatbot";
	}

	private static String secretKey = "V2xtWE9FaXdzT3RnZmJZRHZXRlNzSXVVV1hWZXV2S1k=";
    private static String apiUrl = "https://2udht0boyu.apigw.ntruss.com/custom/v1/7343/97973071c34ba996597def31945148e5fef8e4649ad7507720b9701a07c3e416";
    
	  @MessageMapping("/sendMessage")
	  @SendTo("/topic/public")
	  public String sendMessage(@Payload String chatMessage) throws IOException {
	    	{

            URL url = new URL(apiUrl);
            

            String message =  getReqMessage(chatMessage);
            String encodeBase64String = makeSignature(message, secretKey);
            
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setRequestMethod("POST");
            con.setRequestProperty("Content-Type", "application/json;UTF-8");
            con.setRequestProperty("X-NCP-CHATBOT_SIGNATURE", encodeBase64String);

            // post request
            con.setDoOutput(true);
            DataOutputStream wr = new DataOutputStream(con.getOutputStream());
            wr.write(message.getBytes("UTF-8"));
            wr.flush();
            wr.close();
            int responseCode = con.getResponseCode();

            BufferedReader br;

            if(responseCode==200) { // Normal call
                System.out.println(con.getResponseMessage());

                BufferedReader in = new BufferedReader(
                        new InputStreamReader(
                                con.getInputStream()));
                String decodedString;
                String jsonString = "";
                while ((decodedString = in.readLine()) != null) {
                	jsonString = decodedString;
                	//chatMessage = decodedString;
                }
                //chatbotMessage = decodedString;
                
                JSONParser jsonparser = new JSONParser();
    			try {
    				System.out.println(jsonString);
    				JSONObject json = (JSONObject)jsonparser.parse(jsonString);
    				JSONArray bubblesArray = (JSONArray)json.get("bubbles");
    				JSONObject bubbles = (JSONObject)bubblesArray.get(0);
    				JSONObject data = (JSONObject)bubbles.get("data");
    				String description = "";
    				description = (String)data.get("description");
    				chatMessage = description;
    			} catch (Exception e) {
    				System.out.println("error");
    				e.printStackTrace();
    				
    			}
    			
                in.close();

            } else {  // Error occurred
                chatMessage = con.getResponseMessage();
            }
        }
	    	
        return chatMessage;
    }

    public static String makeSignature(String message, String secretKey) {

        String encodeBase64String = "";

        try {
            byte[] secrete_key_bytes = secretKey.getBytes("UTF-8");

            SecretKeySpec signingKey = new SecretKeySpec(secrete_key_bytes, "HmacSHA256");
            Mac mac = Mac.getInstance("HmacSHA256");
            mac.init(signingKey);

            byte[] rawHmac = mac.doFinal(message.getBytes("UTF-8"));
            encodeBase64String = Base64.encodeBase64String(rawHmac);

            return encodeBase64String;
        } catch (Exception e){
            System.out.println(e);
        }

        return encodeBase64String;

    }

    public static String getReqMessage(String voiceMessage) {

        String requestBody = "";

        try {

        	JSONObject obj = new JSONObject();

            long timestamp = new Date().getTime();

        	obj.put("version", "v2");
            obj.put("userId", "U47b00b58c90f8e47428af8b7bddc1231heo2");
            obj.put("timestamp", timestamp);


            JSONObject data_obj = new JSONObject();
            
            if(voiceMessage.length()==2) {
            	data_obj.put("description", "");
            }else if(voiceMessage != "") {
            	data_obj.put("description", voiceMessage);
            };

            JSONObject bubbles_obj = new JSONObject();
            bubbles_obj.put("type", "text");
            bubbles_obj.put("data", data_obj);

            JSONArray bubbles_array = new JSONArray();
            bubbles_array.add(bubbles_obj);

            obj.put("bubbles", bubbles_array);
            
            if(voiceMessage.length()==2) {
            	obj.put("event", "open");
            }else if(voiceMessage != "") {
            	obj.put("event", "send");
            };

            requestBody = obj.toString();
            
            /*
            }else if(voiceMessage == "persistentmenu") {
            	obj.put("version", "v2");
                obj.put("userId", "U47b00b58c90f8e47428af8b7bddc1231heo2");
                obj.put("timestamp", timestamp);
                
                JSONObject data_obj = new JSONObject();
                data_obj.put("type", "template");
                data_obj.put("title", "Tap to hide the text menu");
                
                JSONObject table_obj = new JSONObject();
                JSONArray table_array = new JSONArray();
                
                JSONObject content1_obj = new JSONObject();
	                content1_obj.put("colSpan",1);
	                content1_obj.put("rowSpan",1);
	                JSONObject con1_data = new JSONObject();
	                con1_data.put("type", "button");
	                con1_data.put("title", "이용문의");
	                JSONObject con1_data_data = new JSONObject();
	                con1_data_data.put("type", "basic");
	                JSONObject con1_data_data_action = new JSONObject();
	                con1_data_data_action.put("type", "postback");
	                JSONObject con1_data_data_action_data = new JSONObject();
	                con1_data_data_action_data.put("postback", "이용 안내는 ~~");
	                con1_data_data_action.put("data", con1_data_data_action_data);
	                con1_data_data.put("action", con1_data_data_action);
	                con1_data.put("data", con1_data_data);
	                content1_obj.put("data", con1_data);
                
                JSONObject content2_obj = new JSONObject();
	                content2_obj.put("colSpan",1);
	                content2_obj.put("rowSpan",1);
	                JSONObject con2_data = new JSONObject();
	                con2_data.put("type", "button");
	                con2_data.put("title", "환불문의");
	                JSONObject con2_data_data = new JSONObject();
	                con2_data_data.put("type", "basic");
	                JSONObject con2_data_data_action = new JSONObject();
	                con2_data_data_action.put("type", "postback");
	                JSONObject con2_data_data_action_data = new JSONObject();
	                con2_data_data_action_data.put("postback", "환불 안내는 ~~");
	                con2_data_data_action.put("data", con2_data_data_action_data);
	                con2_data_data.put("action", con2_data_data_action);
	                con2_data.put("data", con2_data_data);
	                content2_obj.put("data", con2_data);
	                
                JSONObject content3_obj = new JSONObject();
	                content3_obj.put("colSpan",1);
	                content3_obj.put("rowSpan",1);
	                JSONObject con3_data = new JSONObject();
	                con3_data.put("type", "button");
	                con3_data.put("title", "결제문의");
	                JSONObject con3_data_data = new JSONObject();
	                con3_data_data.put("type", "basic");
	                JSONObject con3_data_data_action = new JSONObject();
	                con3_data_data_action.put("type", "postback");
	                JSONObject con3_data_data_action_data = new JSONObject();
	                con3_data_data_action_data.put("postback", "환불 안내는 ~~");
	                con3_data_data_action.put("data", con3_data_data_action_data);
	                con3_data_data.put("action", con3_data_data_action);
	                con3_data.put("data", con3_data_data);
	                content3_obj.put("data", con3_data);
                
                table_array.add(content1_obj);
                table_array.add(content2_obj);
                table_array.add(content3_obj);
                
                table_obj.put("contentTable", table_array);
                data_obj.put("data", table_obj);
                
                
                obj.put("persistentMenu", data_obj);
                obj.put("event", "send");
                
                requestBody = obj.toString();
            
            */
        } catch (Exception e){
            System.out.println("## Exception : " + e);
        }

        return requestBody;

    }
}