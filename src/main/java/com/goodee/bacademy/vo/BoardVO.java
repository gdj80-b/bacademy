package com.goodee.bacademy.vo;

<<<<<<< HEAD:src/main/java/com/goodee/bacademy/vo/Notice.java
import java.sql.Date;
=======
public class BoardVO {
>>>>>>> 8f6a6ad7284d7fcc36be3119641f0613c8014933:src/main/java/com/goodee/bacademy/vo/BoardVO.java

import lombok.Data;

@Data
public class Notice {
	private Integer noticeNo;
	private String id;
	private String title;
	private String content;
	private String writer;
	private String updateDate;
	private String createDate;
	private Integer count;
}
