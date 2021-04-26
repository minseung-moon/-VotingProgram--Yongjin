create table TBL_VOTE_202005(
	V_JUMIN char(13) not null primary key,
	V_NAME varchar2(20),
	M_NO char(1),
	V_TIME char(4),
	V_AREA char(20),
	V_CONFIRM char(1)
);

insert into TBL_VOTE_202005 values(99010110001, '������', 1, 0930, '��1��ǥ��', 'N');
insert into TBL_VOTE_202005 values(89010120002, '������', 2, 0930, '��1��ǥ��', 'N');
insert into TBL_VOTE_202005 values(69010110003, '������', 3, 0930, '��1��ǥ��', 'Y');
insert into TBL_VOTE_202005 values(59010120004, 'ȫ����', 4, 0930, '��1��ǥ��', 'Y');
insert into TBL_VOTE_202005 values(79010110005, '������', 5, 0930, '��1��ǥ��', 'Y');
insert into TBL_VOTE_202005 values(89010120006, '������', 1, 0930, '��1��ǥ��', 'Y');
insert into TBL_VOTE_202005 values(59010110007, '������', 1, 0930, '��1��ǥ��', 'Y');
insert into TBL_VOTE_202005 values(49010120008, '������', 3, 0930, '��1��ǥ��', 'Y');
insert into TBL_VOTE_202005 values(79010110009, '������', 3, 0930, '��1��ǥ��', 'Y');
insert into TBL_VOTE_202005 values(59010120010, '������', 4, 0930, '��1��ǥ��', 'Y');
insert into TBL_VOTE_202005 values(99010110011, '������', 5, 0930, '��1��ǥ��', 'Y');
insert into TBL_VOTE_202005 values(79010120012, '������', 1, 1330, '��1��ǥ��', 'Y');
insert into TBL_VOTE_202005 values(59010110013, '������', 4, 1330, '��2��ǥ��', 'Y');
insert into TBL_VOTE_202005 values(89010110014, '������', 2, 1330, '��2��ǥ��', 'Y');
insert into TBL_VOTE_202005 values(99010110015, '������', 3, 1330, '��2��ǥ��', 'Y');
insert into TBL_VOTE_202005 values(79010110016, '������', 2, 1330, '��2��ǥ��', 'Y');
insert into TBL_VOTE_202005 values(89010110017, '������', 4, 1330, '��2��ǥ��', 'Y');
insert into TBL_VOTE_202005 values(99010110018, '������', 2, 1330, '��2��ǥ��', 'Y');
insert into TBL_VOTE_202005 values(99010110019, '������', 4, 1330, '��2��ǥ��', 'Y');
insert into TBL_VOTE_202005 values(79010110020, 'Ȳ����', 5, 1330, '��2��ǥ��', 'Y');
insert into TBL_VOTE_202005 values(69010110021, '������', 3, 1330, '��2��ǥ��', 'Y');
insert into TBL_VOTE_202005 values(79010110022, '������', 3, 1330, '��2��ǥ��', 'Y');
insert into TBL_VOTE_202005 values(99010110023, '������', 1, 1330, '��2��ǥ��', 'Y');
insert into TBL_VOTE_202005 values(59010110024, '������', 3, 1330, '��2��ǥ��', 'Y');

create table TBL_MEMBER_202005(
	M_NO char(1) not null primary key,
	M_NAME varchar2(20),
	P_CODE char(2),
	P_SCHOOL char(1),
	M_JUMIN char(13),
	M_CITY varchar2(20)
);

create sequence member_seq;

insert into TBL_MEMBER_202005 values(member_seq.nextval, '���ĺ�', 'P1', 1, 6603011999991, '����ȭ��');
insert into TBL_MEMBER_202005 values(member_seq.nextval, '���ĺ�', 'P2', 3, 5503011999992, '�ε鷡��');
insert into TBL_MEMBER_202005 values(member_seq.nextval, '���ĺ�', 'P3', 2, 7703011999993, '���Ȳɵ�');
insert into TBL_MEMBER_202005 values(member_seq.nextval, '���ĺ�', 'P4', 2, 8803011999994, '���޷���');
insert into TBL_MEMBER_202005 values(member_seq.nextval, '���ĺ�', 'P5', 3, 9903011999995, '��������');

create table TBL_PARTY_202005(
	P_CODE char(2) not null primary key,
	P_NAME varchar2(20),
	P_INDATE date,
	P_READER varchar2(20),
	P_TEL1 char(3),
	P_TEL2 char(4),
	P_TEL3 char(4)
);

insert into TBL_PARTY_202005 values('P1', 'A����', '2010-01-01', '����ǥ', '02', '1111', '0001');
insert into TBL_PARTY_202005 values('P2', 'B����', '2010-02-01', '���ǥ', '02', '1111', '0002');
insert into TBL_PARTY_202005 values('P3', 'C����', '2010-03-01', '���ǥ', '02', '1111', '0003');
insert into TBL_PARTY_202005 values('P4', 'D����', '2010-04-01', '����ǥ', '02', '1111', '0004');
insert into TBL_PARTY_202005 values('P5', 'E����', '2010-05-01', '�Ӵ�ǥ', '02', '1111', '0005');


select m.m_no, m.m_name, p.p_name, m.p_school, m.m_jumin, m.m_city, p.p_tel1, p.p_tel2, p.p_tel3 from TBL_MEMBER_202005 m inner join TBL_PARTY_202005 p on m.p_code = p.p_code;
select v_name, v_jumin, m_no, v_time, v_confirm from TBL_VOTE_202005;
select m.m_no,m.m_name, count(*) from TBL_MEMBER_202005 m inner join TBL_VOTE_202005 v on m.m_no = v.m_no group by (m.m_name, m.m_no) order by count(*) desc;