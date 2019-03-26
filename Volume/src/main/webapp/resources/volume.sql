
/* Drop Tables */

DROP TABLE eChat CASCADE CONSTRAINTS;
DROP TABLE eComment CASCADE CONSTRAINTS;
DROP TABLE eEntry CASCADE CONSTRAINTS;
DROP TABLE eBBS CASCADE CONSTRAINTS;
DROP TABLE pComment CASCADE CONSTRAINTS;
DROP TABLE pEntry CASCADE CONSTRAINTS;
DROP TABLE pReview CASCADE CONSTRAINTS;
DROP TABLE pBBS CASCADE CONSTRAINTS;
DROP TABLE pPropose CASCADE CONSTRAINTS;
DROP TABLE users CASCADE CONSTRAINTS;




/* Create Tables */

CREATE TABLE eBBS
(
	idx number NOT NULL,
	id varchar2(100) NOT NULL,
	title varchar2(1000) NOT NULL,
	content varchar2(3000) NOT NULL,
	postdate date DEFAULT sysdate,
	start_date date DEFAULT sysdate NOT NULL,
	end_date date DEFAULT sysdate NOT NULL,
	address varchar2(2000) NOT NULL,
	visit_count number DEFAULT 0,
	t_method varchar2(200) NOT NULL,
	t_time varchar2(200) NOT NULL,
	t_point number DEFAULT 0,
	attachedfile varchar2(2000),
	thumbnail varchar2(100),
	e_limit number NOT NULL,
	state varchar2(100),
	report_count number DEFAULT 0,
	PRIMARY KEY (idx)
);


CREATE TABLE eChat
(
	char_idx number NOT NULL,
	idx number NOT NULL,
	id varchar2(100) NOT NULL,
	content varchar2(3000),
	postdate date DEFAULT sysdate,
	PRIMARY KEY (char_idx)
);


CREATE TABLE eComment
(
	comment_idx number NOT NULL,
	idx number NOT NULL,
	id varchar2(100) NOT NULL,
	content varchar2(1000) NOT NULL,
	ranking number DEFAULT 10 NOT NULL,
	postdate date DEFAULT sysdate,
	PRIMARY KEY (comment_idx)
);


CREATE TABLE eEntry
(
	entry_idx number NOT NULL,
	idx number NOT NULL,
	id varchar2(100) NOT NULL,
	regidate date DEFAULT sysdate,
	state varchar2(100),
	PRIMARY KEY (entry_idx)
);


CREATE TABLE pBBS
(
	idx number NOT NULL,
	id varchar2(100) NOT NULL,
	title varchar2(1000) NOT NULL,
	content varchar2(3000) NOT NULL,
	postdate date DEFAULT sysdate,
	start_date date DEFAULT sysdate NOT NULL,
	end_date date DEFAULT sysdate NOT NULL,
	address varchar2(2000) NOT NULL,
	visit_count number DEFAULT 0,
	attachedfile varchar2(2000),
	thumbnail varchar2(100) NOT NULL,
	m_limit number DEFAULT 10 NOT NULL,
	add_point number DEFAULT 1,
	PRIMARY KEY (idx)
);


CREATE TABLE pComment
(
	comment_idx number NOT NULL,
	idx number NOT NULL,
	id varchar2(100) NOT NULL,
	content varchar2(1000) NOT NULL,
	postdate date DEFAULT sysdate,
	PRIMARY KEY (comment_idx)
);


CREATE TABLE pEntry
(
	entry_idx number NOT NULL,
	idx number NOT NULL,
	id varchar2(100) NOT NULL UNIQUE,
	regidate date DEFAULT sysdate,
	result number DEFAULT 1,
	PRIMARY KEY (entry_idx)
);


CREATE TABLE pPropose
(
	propose_idx number NOT NULL,
	id varchar2(100) NOT NULL,
	content varchar2(3000) NOT NULL,
	postdate date DEFAULT sysdate NOT NULL,
	visit_count number DEFAULT 0,
	recommend number DEFAULT 0,
	title varchar2(100) NOT NULL,
	start_date date DEFAULT sysdate,
	end_date date DEFAULT sysdate,
	p_limit number DEFAULT 1 NOT NULL,
	thumbnail varchar2(2000),
	attachedfile varchar2(2000),
	address varchar2(1000) NOT NULL,
	state varchar2(100),
	add_point number DEFAULT 1,
	PRIMARY KEY (propose_idx)
);


CREATE TABLE pReview
(
	review_idx number NOT NULL,
	idx number NOT NULL,
	id varchar2(100) NOT NULL,
	title varchar2(1000) NOT NULL,
	content varchar2(3000) NOT NULL,
	postdate date DEFAULT sysdate,
	attachedfile varchar2(2000),
	PRIMARY KEY (review_idx)
);


CREATE TABLE users
(
	id varchar2(100) NOT NULL,
	pass varchar2(100) NOT NULL,
	name varchar2(100) NOT NULL,
	regidate date DEFAULT sysdate,
	email varchar2(100) NOT NULL,
	point number DEFAULT 0,
	enabled number DEFAULT 1,
	AUTHORITY varchar2(20) DEFAULT 'USER',
	userType varchar2(10) DEFAULT 'user',
	PRIMARY KEY (id)
);



/* Create Foreign Keys */

ALTER TABLE eChat
	ADD FOREIGN KEY (idx)
	REFERENCES eBBS (idx)
;


ALTER TABLE eComment
	ADD FOREIGN KEY (idx)
	REFERENCES eBBS (idx)
;


ALTER TABLE eEntry
	ADD FOREIGN KEY (idx)
	REFERENCES eBBS (idx)
;


ALTER TABLE pComment
	ADD FOREIGN KEY (idx)
	REFERENCES pBBS (idx)
;


ALTER TABLE pEntry
	ADD FOREIGN KEY (idx)
	REFERENCES pBBS (idx)
;


ALTER TABLE pReview
	ADD FOREIGN KEY (idx)
	REFERENCES pBBS (idx)
;


ALTER TABLE eBBS
	ADD FOREIGN KEY (id)
	REFERENCES users (id)
;


ALTER TABLE eChat
	ADD FOREIGN KEY (id)
	REFERENCES users (id)
;


ALTER TABLE eComment
	ADD FOREIGN KEY (id)
	REFERENCES users (id)
;


ALTER TABLE eEntry
	ADD FOREIGN KEY (id)
	REFERENCES users (id)
;


ALTER TABLE pBBS
	ADD FOREIGN KEY (id)
	REFERENCES users (id)
;


ALTER TABLE pComment
	ADD FOREIGN KEY (id)
	REFERENCES users (id)
;


ALTER TABLE pEntry
	ADD FOREIGN KEY (id)
	REFERENCES users (id)
;


ALTER TABLE pPropose
	ADD FOREIGN KEY (id)
	REFERENCES users (id)
;


ALTER TABLE pReview
	ADD FOREIGN KEY (id)
	REFERENCES users (id)
;



