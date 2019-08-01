package com.tget.service.event.domain;

import java.util.HashMap;
import java.util.Map;


public class YoutubeVideo {
	///F
	private String kind;
	private String etag;
	private String videoId;
	private Map<String,Object> id ;
//	= new HashMap<String,Object>(){
//		private String kind;
//		private String videoId;
//	};
	private String channelId;
	private String title;
	private String description;
	private String channelTitle;
	private String thumbnails;
	private Map<String,Object> snippet ;
//	= new HashMap<String,Object>(){
//		private String channelId;
//		private String title;
//		private String description;
//		private String channelTitle;
//	};
	
	///C
	public YoutubeVideo() {
	}

	///M
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	public String getEtag() {
		return etag;
	}
	public void setEtag(String etag) {
		this.etag = etag;
	}
	public String getVideoId() {
		return videoId;
	}
	public void setVideoId(String videoId) {
		this.videoId = videoId;
	}

	public Map<String,Object> getId() {
		return id;
	}
	public void setId(Map<String,Object> id) {
		this.id = id;
		setKind((String)id.get("kind"));
		setVideoId((String)id.get("videoId"));
	}
	public Map<String,Object> getSnippet() {
		return snippet;
	}
	public void setSnippet(Map<String,Object> snippet) {
		this.snippet = snippet;
		setChannelId((String)snippet.get("channelId"));
		setTitle((String)snippet.get("title"));
		setDescription((String)snippet.get("description"));
		setThumbnails(((String)((Map<String,Object>)((Map<String,Object>)snippet.get("thumbnails")).get("default")).get("url")));
	}
	public String getChannelId() {
		return channelId;
	}
	public void setChannelId(String channelId) {
		this.channelId = channelId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title.replaceAll("&quot;", "\"").replaceAll("&#39;", "'");
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description.replaceAll("&quot;", "\"").replaceAll("&#39;", "'");
	}
	public String getChannelTitle() {
		return channelTitle;
	}
	public void setChannelTitle(String channelTitle) {
		this.channelTitle = channelTitle;
	}
	public String getThumbnails() {
		return thumbnails;
	}
	public void setThumbnails(String thumbnails) {
		this.thumbnails = thumbnails;
	}

	public String toString() {
		return "\n ---------------------------------------------------------"
				+"\n[kind] "+kind+", [etag]"+etag+", [videoId]"+videoId+", [channelId]"+channelId
				+", [title]"+title+", [description]"+description+", [channelTitle]"+channelTitle+", [thumbnails]"+thumbnails;
	}
}
