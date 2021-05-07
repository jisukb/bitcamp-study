# 예제

insert into pet_user(name, nick, id, pwd, email, phone, role)
values ("이름1", "닉네임1", "아이디", "1111", "aaa@aaa.com", "010", 1);

insert into pet_city(cname) values("인천광역시");

insert into pet_state(cno, gname) values(20, "연수구");

insert into pet_hp(gno, name, tel, parking, vet, time, grade, lat, lon)
values (1, "다홍동물병원", "02-1234-2345", 1, 3, now(), 5, 32.0, 54.0);

insert into pet_hp_phot(hno, photo) values(1, "aa.jpg");

insert into pet_hp_review(hno, mno, service, clean, cost, cont, rphoto)
values (1, 1, 5, 5, 5, "좋음", "aaa.jpg");

insert into pet_mypet(mno, pname, age, birth, gender)
values(1, "깜돌이", 12, "2020-1-1", 1);

insert into pet_hprecord(pno, hno, state, history)
values(1, 1, 2, "아픔");

insert into pet_mytown(mno, gno, title, cont)
values(1, 1, "aaa", "aaa");

insert into pet_hp_bookmark(mno, hno)
values(1, 1);

insert into pet_qna(mno, title, cont)
values(1, "www", "sss");

insert into pet_mark(mno, category, title, cont)
values(1, 1, "ㅁㅁㅁ", "ㅈㅈㅈ");

insert into pet_mytown_comt(mno, cont)
values(1, "댓글");

insert into pet_mark_phot(sno, photo)
values(1, "www.jpg");

insert into pet_like(mno, sno)
values(1, 1);

insert into pet_mark_comt(sno, mno, cont)
values(1, 1, "나눔 댓글");

insert into pet_st_news(title, url, site)
values("제목", "url", "사이트");

insert into pet_st_scrap(nno, mno)
values(1, 1);





