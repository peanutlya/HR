package service;

import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;
import java.util.Map;

public class AuthService {
    public static String getAuth() {
        String APP_ID = "11693235";
        String API_KEY = "MzGsgh3xqKybbb4Uowbp096r";
        String SECRET_KEY = "uG4eoaZSn9QfGjzzj5plr511ygHzz6AR";
        return getAuth(API_KEY,SECRET_KEY);
    }

    private static String getAuth(String ak, String sk) {
        // TODO Auto-generated method stub
        String authHost = "https://aip.baidubce.com/oauth/2.0/token?";
        String getAccesssTokenUrl=authHost+"grant_type=client_credentials"+"&client_id="+ak+"&client_secret="+sk;

        try {
            URL realUrl=new URL(getAccesssTokenUrl);
            // 打开和URL之间的连接
            HttpURLConnection connection = (HttpURLConnection) realUrl.openConnection();
            connection.setRequestMethod("GET");
            connection.connect();
            // 获取所有响应头字段
            Map<String, List<String>> map = connection.getHeaderFields();
            // 遍历所有的响应头字段
            for (String key : map.keySet()) {
                System.err.println(key + "--->" + map.get(key));
            }
            // 定义 BufferedReader输入流来读取URL的响应
            BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
            String result = "";
            String line;
            while ((line = in.readLine()) != null) {
                result += line;
            }
            /**
             * 返回结果示例
             */
            System.err.println("result:" + result);
            JSONObject jsonObject = new JSONObject(result);
            System.out.println("这时jsonObject"+jsonObject);
            String access_token = jsonObject.getString("access_token");
            return access_token;
        }catch (Exception e) {
            System.err.printf("获取token失败！");
            e.printStackTrace(System.err);
        }
        return null;
    }
}
