/*
 * Copyright (C) 2017 Baidu, Inc. All Rights Reserved.
 */
package utils;

import com.google.gson.*;
import com.google.gson.reflect.TypeToken;

import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Json工具类.
 */
public class GsonUtils {
	private static Gson gson = new GsonBuilder().create();

	public static String toJson(Object value) {
		return gson.toJson(value);
	}

	public static <T> T fromJson(String json, Class<T> classOfT)
			throws JsonParseException {
		return gson.fromJson(json, classOfT);
	}

	public static <T> T fromJson(String json, Type typeOfT)
			throws JsonParseException {
		return (T) gson.fromJson(json, typeOfT);
	}

	public static String createGsonString(Object object) {
		Gson gson = new Gson();
		String gsonString = gson.toJson(object);
		return gsonString;
	}

	public static <T> T changeGsonToBean(String gsonString, Class<T> cls) {
		Gson gson = new Gson();
		T t = gson.fromJson(gsonString, cls);
		return t;
	}

	public static <T> List<T> changeGsonToList(String gsonString, Class<T> cls) {
		//下面代码会发生泛型擦除
       /* Gson gson = new Gson();
        List<T> list = gson.fromJson(gsonString, new TypeToken<List<T>>() {}.getType());*/
		List<T> list = new ArrayList<T>();
		Gson gson = new Gson();
		JsonArray arry = new JsonParser().parse(gsonString).getAsJsonArray();
		for (JsonElement jsonElement : arry) {
			list.add(gson.fromJson(jsonElement, cls));
		}
		return list;
	}


	public static <T> List<Map<String, T>> changeGsonToListMaps(
			String gsonString) {
		List<Map<String, T>> list = null;
		Gson gson = new Gson();
		list = gson.fromJson(gsonString, new TypeToken<List<Map<String, T>>>() {
		}.getType());
		return list;
	}

	public static <T> Map<String, T> changeGsonToMaps(String gsonString) {
		Map<String, T> map = null;
		Gson gson = new Gson();
		map = gson.fromJson(gsonString, new TypeToken<Map<String, T>>() {
		}.getType());
		return map;
	}


}
