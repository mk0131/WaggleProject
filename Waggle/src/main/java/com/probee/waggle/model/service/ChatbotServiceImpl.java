package com.probee.waggle.model.service;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Base64;
import java.util.Date;
import java.util.Objects;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Service;

@Service
public class ChatbotServiceImpl implements ChatbotService {

	@Override
	public String main(String voiceMessage) {
		String secretKey = "V2xtWE9FaXdzT3RnZmJZRHZXRlNzSXVVV1hWZXV2S1k";
		String apiURL = "https://2udht0boyu.apigw.ntruss.com/custom/v1/7343/97973071c34ba996597def31945148e5fef8e4649ad7507720b9701a07c3e416";

		String chatbotMessage = ""; // 응답 메세지
		try {
			// String apiURL = "https://ex9av8bv0e.apigw.ntruss.com/custom_chatbot/prod/";

			URL url = new URL(apiURL);

			String message = getReqMessage(voiceMessage);
			System.out.println("##" + message);

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

			if (responseCode == 200) { // Normal call
				System.out.println(con.getResponseMessage());

				BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
				String decodedString;
				while ((decodedString = in.readLine()) != null) {
					chatbotMessage = decodedString;
				}
				in.close();
				// 응답 메세지 출력
				System.out.println(chatbotMessage);
				chatbotMessage = jsonToString(chatbotMessage);
			} else { // Error occurred
				chatbotMessage = con.getResponseMessage();
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return chatbotMessage;
	}

	public static String makeSignature(String message, String secretKey) {

		String encodeBase64String = "";

		try {
			byte[] secrete_key_bytes = secretKey.getBytes("UTF-8");

			SecretKeySpec signingKey = new SecretKeySpec(secrete_key_bytes, "HmacSHA256");
			Mac mac = Mac.getInstance("HmacSHA256");
			mac.init(signingKey);

			byte[] rawHmac = mac.doFinal(message.getBytes("UTF-8"));
//            encodeBase64String = Base64.encodeToString(rawHmac, Base64.NO_WRAP);
			encodeBase64String = Base64.getEncoder().encodeToString(rawHmac);

			return encodeBase64String;

		} catch (Exception e) {
			System.out.println(e);
		}

		return encodeBase64String;

	}

	public static String getReqMessage(String voiceMessage) {

		String requestBody = "";

		try {

			JSONObject obj = new JSONObject();

			long timestamp = new Date().getTime();

			System.out.println("##" + timestamp);

			obj.put("version", "v2");
			obj.put("userId", "U47b00b58c90f8e47428af8b7bddc1231heo2");
			obj.put("timestamp", timestamp);

			JSONObject bubbles_obj = new JSONObject();
			bubbles_obj.put("type", "text");

			JSONObject data_obj = new JSONObject();
			data_obj.put("description", voiceMessage);

			bubbles_obj.put("type", "text");
			bubbles_obj.put("data", data_obj);

			JSONArray bubbles_array = new JSONArray();
			bubbles_array.put(bubbles_obj);

			obj.put("bubbles", bubbles_array);

			if (Objects.equals(voiceMessage, "")) {
				obj.put("event", "open"); // 월컴 메세지
			} else {
				obj.put("event", "send");
			}
			requestBody = obj.toString();
			// 웰컴 메세지 출력

		} catch (Exception e) {
			System.out.println("## Exception : " + e);
		}
		return requestBody;
	}

	@Override
	public String jsonToString(String jsonResultStr) {
		String resultText = "";
		// API 호출 결과 받은 JSON 형태 문자열에서 텍스트 추출
		// JSONParser 사용하지 않음
		// images / 0 / fields / inferText 추출
		JSONObject jsonObj = new JSONObject(jsonResultStr);
		JSONArray chatArray = (JSONArray) jsonObj.get("bubbles");
		JSONObject tempObj = (JSONObject) chatArray.get(0);
		JSONObject dataObj = (JSONObject) tempObj.get("data");
//      tempObj = (JSONObject) dataObj.get("description");
		resultText += (String) dataObj.get("description");
		return resultText;
	}

}
