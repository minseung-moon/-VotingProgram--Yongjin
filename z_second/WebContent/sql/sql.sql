create table TBL_VOTE_202005(
	V_JUMIN char(13) not null primary key,
	V_NAME varchar2(20),
	M_NO char(1),
	V_TIME char(4),
	V_AREA char(20),
	V_CONFIRM char(1)
);

insert into TBL_VOTE_202005 values(99010110001, '김유권', 1, 0930, '제1투표장', 'N');
insert into TBL_VOTE_202005 values(89010120002, '이유권', 2, 0930, '제1투표장', 'N');
insert into TBL_VOTE_202005 values(69010110003, '박유권', 3, 0930, '제1투표장', 'Y');
insert into TBL_VOTE_202005 values(59010120004, '홍유권', 4, 0930, '제1투표장', 'Y');
insert into TBL_VOTE_202005 values(79010110005, '조유권', 5, 0930, '제1투표장', 'Y');
insert into TBL_VOTE_202005 values(89010120006, '최유권', 1, 0930, '제1투표장', 'Y');
insert into TBL_VOTE_202005 values(59010110007, '지유권', 1, 0930, '제1투표장', 'Y');
insert into TBL_VOTE_202005 values(49010120008, '장유권', 3, 0930, '제1투표장', 'Y');
insert into TBL_VOTE_202005 values(79010110009, '정유권', 3, 0930, '제1투표장', 'Y');
insert into TBL_VOTE_202005 values(59010120010, '강유권', 4, 0930, '제1투표장', 'Y');
insert into TBL_VOTE_202005 values(99010110011, '신유권', 5, 0930, '제1투표장', 'Y');
insert into TBL_VOTE_202005 values(79010120012, '오유권', 1, 1330, '제1투표장', 'Y');
insert into TBL_VOTE_202005 values(59010110013, '현유권', 4, 1330, '제2투표장', 'Y');
insert into TBL_VOTE_202005 values(89010110014, '왕유권', 2, 1330, '제2투표장', 'Y');
insert into TBL_VOTE_202005 values(99010110015, '유유권', 3, 1330, '제2투표장', 'Y');
insert into TBL_VOTE_202005 values(79010110016, '한유권', 2, 1330, '제2투표장', 'Y');
insert into TBL_VOTE_202005 values(89010110017, '문유권', 4, 1330, '제2투표장', 'Y');
insert into TBL_VOTE_202005 values(99010110018, '양유권', 2, 1330, '제2투표장', 'Y');
insert into TBL_VOTE_202005 values(99010110019, '구유권', 4, 1330, '제2투표장', 'Y');
insert into TBL_VOTE_202005 values(79010110020, '황유권', 5, 1330, '제2투표장', 'Y');
insert into TBL_VOTE_202005 values(69010110021, '배유권', 3, 1330, '제2투표장', 'Y');
insert into TBL_VOTE_202005 values(79010110022, '전유권', 3, 1330, '제2투표장', 'Y');
insert into TBL_VOTE_202005 values(99010110023, '고유권', 1, 1330, '제2투표장', 'Y');
insert into TBL_VOTE_202005 values(59010110024, '권유권', 3, 1330, '제2투표장', 'Y');

create table TBL_MEMBER_202005(
	M_NO char(1) not null primary key,
	M_NAME varchar2(20),
	P_CODE char(2),
	P_SCHOOL char(1),
	M_JUMIN char(13),
	M_CITY varchar2(20)
);

create sequence member_seq;

insert into TBL_MEMBER_202005 values(member_seq.nextval, '김후보', 'P1', 1, 6603011999991, '수선화동');
insert into TBL_MEMBER_202005 values(member_seq.nextval, '이후보', 'P2', 3, 5503011999992, '민들래동');
insert into TBL_MEMBER_202005 values(member_seq.nextval, '박후보', 'P3', 2, 7703011999993, '나팔꽃동');
insert into TBL_MEMBER_202005 values(member_seq.nextval, '조후보', 'P4', 2, 8803011999994, '진달래동');
insert into TBL_MEMBER_202005 values(member_seq.nextval, '최후보', 'P5', 3, 9903011999995, '개나리동');

create table TBL_PARTY_202005(
	P_CODE char(2) not null primary key,
	P_NAME varchar2(20),
	P_INDATE date,
	P_READER varchar2(20),
	P_TEL1 char(3),
	P_TEL2 char(4),
	P_TEL3 char(4)
);

insert into TBL_PARTY_202005 values('P1', 'A정당', '2010-01-01', '위대표', '02', '1111', '0001');
insert into TBL_PARTY_202005 values('P2', 'B정당', '2010-02-01', '명대표', '02', '1111', '0002');
insert into TBL_PARTY_202005 values('P3', 'C정당', '2010-03-01', '기대표', '02', '1111', '0003');
insert into TBL_PARTY_202005 values('P4', 'D정당', '2010-04-01', '옥대표', '02', '1111', '0004');
insert into TBL_PARTY_202005 values('P5', 'E정당', '2010-05-01', '임대표', '02', '1111', '0005');


select m.m_no, m.m_name, p.p_name, m.p_school, m.m_jumin, m.m_city, p.p_tel1, p.p_tel2, p.p_tel3 from TBL_MEMBER_202005 m inner join TBL_PARTY_202005 p on m.p_code = p.p_code;
select v_name, v_jumin, m_no, v_time, v_confirm from TBL_VOTE_202005;
select m.m_no,m.m_name, count(*) from TBL_MEMBER_202005 m inner join TBL_VOTE_202005 v on m.m_no = v.m_no group by (m.m_name, m.m_no) order by count(*) desc;