## drop database workspace;

create database workspace charset utf8mb4;

use workspace;

create table `position`(
	positionNo bigint auto_increment not null,
    position char(20) not null,
	`desc` varchar(50),
    primary key(positionNo)
);

create table member (
    empNo bigint auto_increment not null,
    userid varchar(30) not null,
    password varchar(30) not null,
    name char(15) not null,
    positionNo bigint not null,
    department char(20) not null,
    icon varchar(255) default "/image/Asset4.png",
    email varchar(25),
    phone varchar(15),
    primary key(empno, userid),
    foreign key(positionNo) references `position`(positionNo)
);

create table documents (
	docNo bigint auto_increment not null,
    empNo bigint not null,
    title varchar(100) not null,
    body text(6000),
    status char(15) not null,
    attachedFile varchar(255),
    attachedFileName varchar(255),
    line int not null,
    useYn varchar(1) default 'y' not null,
    firstApproverNo bigint not null,
    secondApproverNo bigint not null,
    thirdApproverNo bigint not null,
    returnComment varchar(255),
    primary key(docNo),
    foreign key(empNo) references member(empNo)
);

create table article(
	articleNo bigint auto_increment not null,
    author char(15) not null,
    title varchar(100) not null,
    body text(6000) not null,
    empNo bigint not null,
    primary key(articleNo),
    foreign key(empNo) references member(empNo)
);

insert into `position` (position) values("회장");
insert into `position` (position) values("부회장");
insert into `position` (position) values("사장");
insert into `position` (position) values("부사장");
insert into `position` (position) values("전무");
insert into `position` (position) values("상무");
insert into `position` (position) values("이사");
insert into `position` (position) values("부장");
insert into `position` (position) values("차장");
insert into `position` (position) values("과장");
insert into `position` (position) values("대리");
insert into `position` (position) values("주임");
insert into `position` (position) values("사원");
insert into `position` (position) values("인턴");

insert into member(userid, password, name, positionNo, department, icon, email, phone) values("yun", "1234", "노윤건", 8, "영업부", "/image/노윤건.png", 'yun@workspace.com', '100');
insert into member(userid, password, name, positionNo, department, icon, email, phone) values("jong", "2345", "전종배", 9, "마케팅부", "/image/전종배.png", 'jong@workspace.com', '200');
insert into member(userid, password, name, positionNo, department, icon, email, phone) values("hye", "3456", "한혜림",  11, "마케팅부", "/image/한혜림.png", 'hye@workspace.com', '200');
insert into member(userid, password, name, positionNo, department, icon, email, phone) values("ju", "4567", "김주원",  12, "영업부", "/image/김주원.png", 'ju@workspace.com', '100');
insert into member(userid, password, name, positionNo, department, icon, email, phone) values("hong", "1111", "홍길동",  13, "영업부", "/image/홍길동.png", 'hong@workspace.com', '100');

insert into documents(empNo, title, body, status, attachedFile, attachedFileName, line, firstApproverNo, secondApproverNo, thirdApproverNo) values(4, "기안서 입니다.", "기안서 제출합니다.", "progress", "", "", 1, 3, 2, 1);
insert into documents(empNo, title, body, status, attachedfile, attachedFileName, line, firstApproverNo, secondApproverNo, thirdApproverNo) values(5, "품의서 입니다.", "품의서 제출합니다.", "return", "", "", 2, 4, 3, 2);
insert into documents(empNo, title, body, status, attachedfile, attachedFileName, line, firstApproverNo, secondApproverNo, thirdApproverNo) values(5, "기획안 입니다.", "기획안 제출합니다.", "complete", "", "", 4, 4, 2, 1);

insert into article(author, title, body, empNo) values("김주원", "24년 시무식 일정",
"일시 : 2024년 1월 8일 오후 7시
장소 : 코젤 다크 하우스 합정
연락처 : 0507-1327-7757
위치 : https://naver.me/5PSVhxGq
문의 : 김주임 ( 010-2525-8585 )",4);
insert into article(author, title, body, empNo) values("한혜림", "디자인팀 프리젠테이션 일정",
"일시 : 2024년 1월 15일 오후 1시
장소 : 3층 대회의실
문의 : 한대리 ( 010-3000-5555 )",3);
insert into article(author, title, body, empNo) values("노윤건", "영업팀 신규 프로젝트 발표",
"일시 : 2024년 1월 27일 오후 3시
장소 : 2층 소회의실
문의 : 노부장 ( 010-2000-3355 )",1);
insert into article(author, title, body, empNo) values("전종배", "개발팀 신입사원 2차 면접",
"일시 : 2024년 1월 17일 오전 8시 30분
장소 : 3층 대회의실
문의 : 전차장 ( 010-2340-3256 )",2);
insert into article(author, title, body, empNo) values("김주원", "부서별 업무 보고 일정",
"일시 : 2024년 1월 10일 오후 3시
장소 : 5층 사장실
문의 : 김주임 ( 010-2525-8585 )",4);
insert into article(author, title, body, empNo) values("노윤건", "해외 시장 조사 일정",
"일시 : 2024년 1월 15 ~ 2024년 1월 19일 (5일간)
지역 : 중국 상하이
문의 : 노부장 ( 010-2000-3355 )",1);
insert into article(author, title, body, empNo) values("한혜림", "사내 배구 대회 개최 안내",
"일시 : 2024년 1월 12일 오후 1시
장소 : 고양 실내 체육관
상금 : 100만원
문의 : 한대리 ( 010-3000-5555 )",3);
insert into article(author, title, body, empNo) values("김주원", "영업팀 신입사원 1차 면접",
"일시 : 2024년 1월 17일 오전 9시 30분
장소 : 2층 소회의실
문의 : 김주임 ( 010-2525-8585 )",4);
insert into article(author, title, body, empNo) values("한혜림", "마케팅팀 업무 보고 일정",
"일시 : 2024년 1월 19일 오후 3시
장소 : 5층 사장실
문의 : 한대리 ( 010-3000-5555 )",3);
insert into article(author, title, body, empNo) values("전종배", "마이크로소프트 빌드 코리아(Microsoft Build Korea)",
"일시 : 2024년 2월 6일 오후 2시
장소 : 삼성동 코엑스
문의 : 전차장 ( 010-2340-3256 )",2);
insert into article(author, title, body, empNo) values("한혜림", "로테르담 디자인 페어 참가",
"일시 : 2024년 2월 6일 ~ 2024년 2월 9일
위치 : 네덜란드 Exhibitions Rotterdam (https://www.artindexrotterdam.nl/)
문의 : 한대리 ( 010-3000-5555 )",3);


