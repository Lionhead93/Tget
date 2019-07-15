
DROP TABLE point_history;
DROP TABLE transaction;
DROP TABLE ticket;
DROP TABLE coupon;
DROP TABLE alarm;
DROP TABLE user_interested;
DROP TABLE report;
DROP TABLE reply;
DROP TABLE image_file;
DROP TABLE content;
DROP TABLE users;
DROP TABLE youtube;
DROP TABLE recommended_event;
DROP TABLE event;
DROP TABLE category_two;


DROP SEQUENCE seq_youtube_youtube_no 			INCREMENT BY 1 START WITH 10000;
DROP SEQUENCE seq_category_two_no 			INCREMENT BY 1 START WITH 10000;
DROP SEQUENCE seq_user_Interested_no			INCREMENT BY 1 START WITH 10000;
DROP SEQUENCE seq_content_content_no			INCREMENT BY 1 START WITH 10000;
DROP SEQUENCE seq_image_file_file_no			INCREMENT BY 1 START WITH 10000;
DROP SEQUENCE seq_reply_reply_no 			INCREMENT BY 1 START WITH 10000;
DROP SEQUENCE seq_report_report_no 			INCREMENT BY 1 START WITH 10000;
DROP SEQUENCE seq_alarm_alarm_no			INCREMENT BY 1 START WITH 10000;
DROP SEQUENCE seq_coupon_coupon_no			INCREMENT BY 1 START WITH 10000;
DROP SEQUENCE seq_ticket_ticket_no			INCREMENT BY 1 START WITH 10000;
DROP SEQUENCE seq_transaction_tran_no			INCREMENT BY 1 START WITH 10000;
DROP SEQUENCE seq_point_history_no 			INCREMENT BY 1 START WITH 10000;


CREATE SEQUENCE seq_youtube_youtube_no 			INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_category_two_no 			INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_user_Interested_no			INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_content_content_no			INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_image_file_file_no			INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_reply_reply_no 			INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_report_report_no 			INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_alarm_alarm_no			INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_coupon_coupon_no			INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_ticket_ticket_no			INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_transaction_tran_no			INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_point_history_no 			INCREMENT BY 1 START WITH 10000;

CREATE TABLE category_two(
	category_two_no		NUMBER(5) 	NOT NULL,
	category_one_code	CHAR(1) 		NOT NULL,
	category_two_name	 VARCHAR2(30) 	NOT NULL UNIQUE,
	category_two_eng		VARCHAR2(30) 	NOT NULL UNIQUE,
	PRIMARY KEY(category_two_no)
);

CREATE TABLE event(
	event_id		VARCHAR2(10) 	NOT NULL,
	view_count	NUMBER(10) 	DEFAULT 1,
	category_two_eng	VARCHAR2(30) 	NOT NULL REFERENCES category_two(category_two_eng),
	event_image	VARCHAR2(100),
	event_name	VARCHAR2(50) 	NOT NULL,
	event_location	VARCHAR2(50) 	NOT NULL,
	event_date	DATE 		NOT NULL,
	event_time	VARCHAR2(10) 	NOT NULL,
	PRIMARY KEY(event_id)
);

CREATE TABLE recommended_event(
	recomm_event_no		NUMBER(5) 	NOT NULL,
	event_name		VARCHAR2(50) 	NOT NULL,
	video_name		VARCHAR2(100) 	NOT NULL,
	recomm_event_name	VARCHAR2(20) 	NOT NULL,
	recomm_event_detail	VARCHAR2(50),
	PRIMARY KEY(recomm_event_no)
);

CREATE TABLE youtube(
	youtube_no	NUMBER(5) 	NOT NULL,
	youtube_id	VARCHAR2(20) 	NOT NULL,
	event_name	VARCHAR2(50) 	NOT NULL,
	PRIMARY KEY(youtube_no)
);

CREATE TABLE users(
	user_id 			VARCHAR2(30) 	NOT NULL,
	user_name 		VARCHAR2(20) 	NOT NULL,
	password 		VARCHAR2(20) 	NOT NULL,
	phone 			VARCHAR2(20) 	NOT NULL,
	nickname 		VARCHAR2(20) 	UNIQUE,
	address 			VARCHAR2(100),
	postal_code 		VARCHAR2(5),
	role 			CHAR(1)		NOT NULL,
	local 			CHAR(1) 		NOT NULL,
	point 			NUMBER(10),
	user_statement 		CHAR(1) 		NOT NULL,
	last_conn_date 		DATE 		NOT NULL,
	kakao_id 			VARCHAR2(30),
	naver_id 			VARCHAR2(30),
	facebook_id 		VARCHAR2(30),
	blacklist_code 		CHAR(1),
	blacklist_start_date 	DATE,
	blacklist_end_date 		DATE,
	seller_code 		CHAR(1),
	sales_amount 		NUMBER(10),
	sales_count 		NUMBER(10),
	account_bank 		VARCHAR2(30),
	account_no 		VARCHAR2(20),
	PRIMARY KEY(user_id) 
);

CREATE TABLE content(
	content_no 	NUMBER 		NOT NULL,
	user_id 		VARCHAR2(30) 	NOT NULL 	REFERENCES users(user_id),
	user_nickname 	VARCHAR2(20) 	NOT NULL,
	content_name 	VARCHAR2(30) 	NOT NULL,
	content_body 	VARCHAR2(4000) 		NOT NULL,
	file_name 	VARCHAR2(100),
	video_name 	VARCHAR2(100),
	reg_date 		DATE 		NOT NULL,
	view_count 	NUMBER(10),
	board_code 	CHAR(1) 		NOT NULL,
	content_code 	CHAR(1) 		NOT NULL,
	open 		CHAR(1) 		NOT NULL,
	good_count 	NUMBER(10),
	bad_count	NUMBER(10),
	refund_tran_no 	NUMBER(5),
	refund_check 	CHAR(1),
	PRIMARY KEY(content_no));

CREATE TABLE image_file(
	file_no		NUMBER(5) 	NOT NULL,
	file_name		VARCHAR2(50) 	NOT NULL,
	content_no	NUMBER(5) 	NOT NULL 	REFERENCES content(content_no),
	PRIMARY KEY(file_no));

CREATE TABLE reply(
	reply_no 		NUMBER(5) 	NOT NULL,
	user_id 		VARCHAR2(30) 	NOT NULL 	REFERENCES users(user_id),
	user_nickname 	VARCHAR2(20) 	NOT NULL ,
	content_no 	NUMBER(5) 	NOT NULL 	REFERENCES content(content_no),
	reply_body 	VARCHAR2(500) 	NOT NULL,
	reg_date 		DATE 		DEFAULT SYSDATE,
	PRIMARY KEY(reply_no));

CREATE TABLE report(
	report_no 		NUMBER(5) 	NOT NULL,
	white_id 			VARCHAR2(30) 	NOT NULL 	REFERENCES users(user_id),
	white_nickname 		VARCHAR2(20) 	NOT NULL 	,
	black_id 			VARCHAR2(30) 	NOT NULL 	REFERENCES users(user_id),
	report_reason_code 	CHAR(1) 		NOT NULL,
	reg_date 			DATE 		DEFAULT SYSDATE,
	content_no 		NUMBER(5) 	NOT NULL 	REFERENCES content(content_no),
	reply_no 			NUMBER(5)  	,
	check_yn 			CHAR(1) 		NOT NULL,
	report_code 		CHAR(1) 		NOT NULL,
	PRIMARY KEY(report_no));

CREATE TABLE user_Interested(
	Interested_category_no	NUMBER(5) 	NOT NULL,
	user_id			VARCHAR2(30) 	NOT NULL 	REFERENCES users(user_id),
	event_id			VARCHAR2(10) 	NOT NULL 	REFERENCES event(event_id),
	category_two_eng		VARCHAR2(30) 	NOT NULL 	REFERENCES category_two(category_two_eng),
	PRIMARY KEY (Interested_category_no)
);

CREATE TABLE alarm ( 
	alarm_no 		NUMBER(5)		NOT NULL ,
	alarm_body		VARCHAR2(500)		NOT NULL ,
	alarm_date		DATE			NOT NULL ,         
	user_id			VARCHAR2(30)		NOT NULL 	REFERENCES users(user_id) ,
	alarm_keyword			VARCHAR2(50)			NOT NULL ,
	alarm_code			CHAR(1) 			NOT NULL ,
	read			CHAR(1) 			NOT NULL ,	
	PRIMARY KEY(alarm_no)
);

CREATE TABLE coupon(
	coupon_no 		NUMBER(5) 	NOT NULL,
	coupon_code 		CHAR(1) 		NOT NULL,
	user_id 			VARCHAR2(30) 	NOT NULL 	REFERENCES users(user_id),
	coupon_use_date 		DATE,
	coupon_reg_date 		DATE 		NOT NULL,
	coupon_statement 		CHAR(1) 		NOT NULL,
	PRIMARY KEY(coupon_no) );

CREATE TABLE ticket ( 
	ticket_no 		NUMBER(5)		NOT NULL ,
	event_id			VARCHAR2(10)		NOT NULL 	REFERENCES event(event_id),
	ticket_amount 		NUMBER(3)		NOT NULL ,
	seller_id			VARCHAR2(30)		NOT NULL 	REFERENCES users(user_id),
	ticket_price		NUMBER(10)		NOT NULL ,
	ticket_type		CHAR(1)			NOT NULL ,
	ticket_code		CHAR(1)			NOT NULL ,
	ticket_seat		VARCHAR2(20)		NOT NULL ,
	ticket_option		VARCHAR2(500) ,
	reg_date			DATE 			DEFAULT		SYSDATE ,
	ticket_image		VARCHAR2(100)		NOT NULL ,
	check_yn			CHAR(1)			NOT NULL ,
	coupon_no		NUMBER(5) 		REFERENCES coupon(coupon_no) ,
	coupon_code		CHAR(1)	,	
	PRIMARY KEY(ticket_no)
);

CREATE TABLE transaction ( 
	tran_no 			NUMBER(5) 		NOT NULL,
	ticket_no 		NUMBER(5)		NOT NULL REFERENCES ticket(ticket_no),
	event_id			VARCHAR2(10)		NOT NULL REFERENCES event(event_id),
	event_name 		VARCHAR2(50)		NOT NULL ,
	seller_id			VARCHAR2(30)		NOT NULL REFERENCES users(user_id),
	seller_nickname		VARCHAR2(20)		NOT NULL ,
	buyer_id			VARCHAR2(30)		NOT NULL REFERENCES users(user_id),
	buyer_nickname		VARCHAR2(20)		NOT NULL ,
	order_amount		NUMBER(3)		NOT NULL ,
	total_price		NUMBER(10)		NOT NULL ,
	order_date		DATE			DEFAULT		SYSDATE, 
	payment_option		CHAR(1)			NOT NULL ,	
	payment_no		VARCHAR2(20) ,
	tran_code		CHAR(1) 			NOT NULL ,
	delivery_add		VARCHAR2(100) 		NOT NULL ,
	delivery_company		VARCHAR2(10) ,
	delivery_no		NUMBER(20) ,
	delivery_start_date		DATE ,
	review_score		NUMBER(5) ,
	review_body		VARCHAR2(500) ,
	review_reg_date		DATE ,
	refund_account_bank	VARCHAR2(20) ,
	refund_account_no		NUMBER(20) , 
	PRIMARY KEY(tran_no)
);

CREATE TABLE point_history(
	point_history_no		NUMBER(5) 	NOT NULL,
	user_id						VARCHAR2(30) 	NOT NULL 	REFERENCES users(user_id),
	point_update_code		CHAR(1)	 	NOT NULL,
	reg_date						DATE 		DEFAULT SYSDATE,
	tran_no				NUMBER(10) 	NOT NULL 	REFERENCES transaction(tran_no),
	total_point			NUMBER(10) 	NOT NULL,
	update_point			NUMBER(10) 	NOT NULL,
	PRIMARY KEY(point_history_no)
);



INSERT INTO users VALUES ('admin','관리자','1111','01000000000','나관리자얌','서울시 강남구', '00000','2', '0', 10000000, 0, SYSDATE, NULL, NULL, NULL, NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO users VALUES ('manager','관리자2','1111','01000000000','관리자','서울시 강남구', '00000', '2', '0', 10000000, 0, SYSDATE, NULL, NULL, NULL, NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO users VALUES ('buyer','구매자','1111','01000000000','구매자얌','서울시 강남구', '00000', '0', '0', 0, 0, SYSDATE, NULL, NULL, NULL, NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO users VALUES ('seller','판매자','1111','01000000000','판매자얌','서울시 강남구', '00000','1', '0', 0, 0, SYSDATE, NULL, NULL, NULL, NULL,NULL,NULL,'2',1000000,10,'비트은행','123456789');


INSERT INTO category_two VALUES (seq_category_two_no.nextval,'0','콘서트','concert'); 
INSERT INTO category_two VALUES (seq_category_two_no.nextval,'0','페스티벌','festival');
INSERT INTO category_two VALUES (seq_category_two_no.nextval,'1','축구','soccer');
INSERT INTO category_two VALUES (seq_category_two_no.nextval,'1','야구','baseball'); 
INSERT INTO category_two VALUES (seq_category_two_no.nextval,'1','골프','golf');
INSERT INTO category_two VALUES (seq_category_two_no.nextval,'2','뮤지컬','musicals');
INSERT INTO category_two VALUES (seq_category_two_no.nextval,'2','클래식/오페라','opera');


INSERT INTO event	VALUES ('104175821',120408,'concert',NULL,'EXO Seoul','Seoul Olympic Park Gymnastics Stadium (KSPO DOME)',to_date('2019/07/19', 'YYYY/MM/DD'),'2000'); 
INSERT INTO event	VALUES ('104175823',120408,'concert',NULL,'EXO Seoul','Seoul Olympic Park Gymnastics Stadium (KSPO DOME)',to_date('2019/07/20', 'YYYY/MM/DD'),'1800'); 
INSERT INTO event	VALUES ('104175819',120408,'concert',NULL,'EXO Seoul','Seoul Olympic Park Gymnastics Stadium (KSPO DOME)',to_date('2019/07/21', 'YYYY/MM/DD'),'1600'); 
INSERT INTO event	VALUES ('104175345',120408,'concert',NULL,'EXO Seoul','Seoul Olympic Park Gymnastics Stadium (KSPO DOME)',to_date('2019/07/26', 'YYYY/MM/DD'),'2000'); 
INSERT INTO event	VALUES ('104175822',120408,'concert',NULL,'EXO Seoul','Seoul Olympic Park Gymnastics Stadium (KSPO DOME)',to_date('2019/07/27', 'YYYY/MM/DD'),'1800'); 
INSERT INTO event	VALUES ('104175824',120408,'concert',NULL,'EXO Seoul','Seoul Olympic Park Gymnastics Stadium (KSPO DOME)',to_date('2019/07/28', 'YYYY/MM/DD'),'1600'); 

INSERT INTO ticket VALUES (seq_ticket_ticket_no.nextval,'104175823',100 ,'seller',200000,'1','1','스탠딩37번','알콜프리존', sysdate , 'aaa.png','1', null , null ); 
INSERT INTO ticket VALUES (seq_ticket_ticket_no.nextval,'104175822',100 ,'seller',200000,'1','1','스탠딩38번','알콜프리존', sysdate , 'aaa.png','1', null , null ); 
INSERT INTO ticket VALUES (seq_ticket_ticket_no.nextval,'104175345',100 ,'seller',200000,'1','1','스탠딩39번','알콜프리존', sysdate , 'aaa.png','1', null , null ); 
INSERT INTO ticket VALUES (seq_ticket_ticket_no.nextval,'104175822',100 ,'seller',200000,'1','1','스탠딩31번','알콜프리존', sysdate , 'aaa.png','1', null , null ); 
INSERT INTO ticket VALUES (seq_ticket_ticket_no.nextval,'104175824',100 ,'seller',200000,'1','1','스탠딩32번','알콜프리존', sysdate , 'aaa.png','1', null , null ); 


commit;
