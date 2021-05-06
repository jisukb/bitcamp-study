-- 회원
DROP TABLE IF EXISTS TABLE RESTRICT;

-- 펫
DROP TABLE IF EXISTS TABLE3 RESTRICT;

-- 병원
DROP TABLE IF EXISTS TABLE4 RESTRICT;

-- 나눔장터
DROP TABLE IF EXISTS TABLE5 RESTRICT;

-- 우리동네
DROP TABLE IF EXISTS Temporary RESTRICT;

-- 뉴스
DROP TABLE IF EXISTS TABLE6 RESTRICT;

-- 나눔장터사진
DROP TABLE IF EXISTS TABLE8 RESTRICT;

-- 리뷰
DROP TABLE IF EXISTS TABLE9 RESTRICT;

-- 병원사진
DROP TABLE IF EXISTS TABLE10 RESTRICT;

-- 마이펫사진
DROP TABLE IF EXISTS TABLE12 RESTRICT;

-- 스크랩
DROP TABLE IF EXISTS TABLE13 RESTRICT;

-- 관리자
DROP TABLE IF EXISTS TABLE14 RESTRICT;

-- Q&A
DROP TABLE IF EXISTS TABLE17 RESTRICT;

-- 나눔장터 댓글
DROP TABLE IF EXISTS TABLE18 RESTRICT;

-- 우리동네 댓글
DROP TABLE IF EXISTS TABLE20 RESTRICT;

-- Q&A댓글
DROP TABLE IF EXISTS TABLE21 RESTRICT;

-- 병원 즐겨찾기
DROP TABLE IF EXISTS TABLE23 RESTRICT;

-- 내 게시글
DROP TABLE IF EXISTS TABLE25 RESTRICT;

-- 내 찜
DROP TABLE IF EXISTS TABLE26 RESTRICT;

-- 진찰기록
DROP TABLE IF EXISTS TABLE27 RESTRICT;

-- 회원
CREATE TABLE TABLE (
  mno   INTEGER     NOT NULL COMMENT '회원번호', -- 회원번호
  name  VARCHAR(50) NOT NULL COMMENT '이름', -- 이름
  nick  VARCHAR(50) NOT NULL COMMENT '닉네임', -- 닉네임
  email VARCHAR(40) NOT NULL COMMENT '이메일', -- 이메일
  phone VARCHAR(30) NOT NULL COMMENT '휴대전화', -- 휴대전화
  date  DATE        NULL     DEFAULT now() COMMENT '가입일' -- 가입일
)
COMMENT '회원';

-- 회원
ALTER TABLE TABLE
  ADD CONSTRAINT PK_TABLE -- 회원 기본키
    PRIMARY KEY (
      mno -- 회원번호
    );

-- 회원 유니크 인덱스
CREATE UNIQUE INDEX UIX_TABLE
  ON TABLE ( -- 회원
    nick ASC -- 닉네임
  );

-- 회원 유니크 인덱스2
CREATE UNIQUE INDEX UIX_TABLE2
  ON TABLE ( -- 회원
    phone ASC -- 휴대전화
  );

-- 회원 유니크 인덱스3
CREATE UNIQUE INDEX UIX_TABLE3
  ON TABLE ( -- 회원
    email ASC -- 이메일
  );

ALTER TABLE TABLE
  MODIFY COLUMN mno INTEGER NOT NULL AUTO_INCREMENT COMMENT '회원번호';

-- 펫
CREATE TABLE TABLE3 (
  pno    INTEGER     NOT NULL COMMENT '마이펫번호', -- 마이펫번호
  mno    INTEGER     NOT NULL COMMENT '회원번호', -- 회원번호
  pname  VARCHAR(50) NOT NULL COMMENT '이름', -- 이름
  age    INTEGER     NOT NULL COMMENT '나이', -- 나이
  birth  DATE        NOT NULL COMMENT '생년월일', -- 생년월일
  gender INTEGER     NOT NULL COMMENT '성별' -- 성별
)
COMMENT '펫';

-- 펫
ALTER TABLE TABLE3
  ADD CONSTRAINT PK_TABLE3 -- 펫 기본키
    PRIMARY KEY (
      pno -- 마이펫번호
    );

ALTER TABLE TABLE3
  MODIFY COLUMN pno INTEGER NOT NULL AUTO_INCREMENT COMMENT '마이펫번호';

-- 병원
CREATE TABLE TABLE4 (
  hno     INTEGER      NOT NULL COMMENT '병원번호', -- 병원번호
  local   VARCHAR(50)  NOT NULL COMMENT '지역', -- 지역
  name    VARCHAR(50)  NOT NULL COMMENT '이름', -- 이름
  tel     VARCHAR(30)  NOT NULL COMMENT '전화번호', -- 전화번호
  addr    VARCHAR(255) NOT NULL COMMENT '주소', -- 주소
  parking INTEGER      NOT NULL COMMENT '주차여부', -- 주차여부
  vet     INTEGER      NOT NULL COMMENT '수의사', -- 수의사
  time    DATETIME     NULL     COMMENT '진료시간', -- 진료시간
  grade   INTEGER      NULL     COMMENT '평점' -- 평점
)
COMMENT '병원';

-- 병원
ALTER TABLE TABLE4
  ADD CONSTRAINT PK_TABLE4 -- 병원 기본키
    PRIMARY KEY (
      hno -- 병원번호
    );

-- 병원 인덱스
CREATE INDEX IX_TABLE4
  ON TABLE4( -- 병원
    local ASC -- 지역
  );

ALTER TABLE TABLE4
  MODIFY COLUMN hno INTEGER NOT NULL AUTO_INCREMENT COMMENT '병원번호';

-- 나눔장터
CREATE TABLE TABLE5 (
  sno      INTEGER     NOT NULL COMMENT '나눔장터번호', -- 나눔장터번호
  mno      INTEGER     NOT NULL COMMENT '회원번호', -- 회원번호
  category INTEGER     NOT NULL COMMENT '분류', -- 분류
  title    VARCHAR(50) NOT NULL COMMENT '제목', -- 제목
  cont     LONGTEXT    NOT NULL COMMENT '내용', -- 내용
  date     DATETIME    NOT NULL DEFAULT now() COMMENT '작성일' -- 작성일
)
COMMENT '나눔장터';

-- 나눔장터
ALTER TABLE TABLE5
  ADD CONSTRAINT PK_TABLE5 -- 나눔장터 기본키
    PRIMARY KEY (
      sno -- 나눔장터번호
    );

-- 나눔장터 인덱스
CREATE INDEX IX_TABLE5
  ON TABLE5( -- 나눔장터
    title ASC -- 제목
  );

-- 나눔장터 인덱스2
CREATE INDEX IX_TABLE52
  ON TABLE5( -- 나눔장터
  );

ALTER TABLE TABLE5
  MODIFY COLUMN sno INTEGER NOT NULL AUTO_INCREMENT COMMENT '나눔장터번호';

-- 우리동네
CREATE TABLE Temporary (
  tno   INTEGER     NOT NULL COMMENT '우리동네번호', -- 우리동네번호
  mno   INTEGER     NOT NULL COMMENT '회원번호', -- 회원번호
  local VARCHAR(50) NOT NULL COMMENT '지역', -- 지역
  title VARCHAR(50) NOT NULL COMMENT '제목', -- 제목
  cont  LONGTEXT    NOT NULL COMMENT '내용(사진)', -- 내용(사진)
  date  DATETIME    NOT NULL DEFAULT now() COMMENT '작성일', -- 작성일
  view  INTEGER     NULL     COMMENT '조회수' -- 조회수
)
COMMENT '우리동네';

-- 우리동네
ALTER TABLE Temporary
  ADD CONSTRAINT PK_Temporary -- 우리동네 기본키
    PRIMARY KEY (
      tno -- 우리동네번호
    );

-- 우리동네 인덱스
CREATE INDEX IX_Temporary
  ON Temporary( -- 우리동네
    title ASC -- 제목
  );

-- 우리동네 인덱스2
CREATE INDEX IX_Temporary2
  ON Temporary( -- 우리동네
  );

ALTER TABLE Temporary
  MODIFY COLUMN tno INTEGER NOT NULL AUTO_INCREMENT COMMENT '우리동네번호';

-- 뉴스
CREATE TABLE TABLE6 (
  nno      INTEGER      NOT NULL COMMENT '뉴스번호', -- 뉴스번호
  admin_id VARCHAR(50)  NOT NULL COMMENT 'id', -- id
  title    VARCHAR(50)  NOT NULL COMMENT '제목', -- 제목
  url      VARCHAR(255) NOT NULL COMMENT 'URL', -- URL
  site     VARCHAR(50)  NOT NULL COMMENT '제공사이트', -- 제공사이트
  date     DATETIME     NOT NULL DEFAULT now() COMMENT '등록일' -- 등록일
)
COMMENT '뉴스';

-- 뉴스
ALTER TABLE TABLE6
  ADD CONSTRAINT PK_TABLE6 -- 뉴스 기본키
    PRIMARY KEY (
      nno -- 뉴스번호
    );

ALTER TABLE TABLE6
  MODIFY COLUMN nno INTEGER NOT NULL AUTO_INCREMENT COMMENT '뉴스번호';

-- 나눔장터사진
CREATE TABLE TABLE8 (
  spno  INTEGER      NOT NULL COMMENT '사진번호', -- 사진번호
  sno   INTEGER      NOT NULL COMMENT '나눔장터번호', -- 나눔장터번호
  photo VARCHAR(255) NOT NULL COMMENT '사진' -- 사진
)
COMMENT '나눔장터사진';

-- 나눔장터사진
ALTER TABLE TABLE8
  ADD CONSTRAINT PK_TABLE8 -- 나눔장터사진 기본키
    PRIMARY KEY (
      spno -- 사진번호
    );

ALTER TABLE TABLE8
  MODIFY COLUMN spno INTEGER NOT NULL AUTO_INCREMENT COMMENT '사진번호';

-- 리뷰
CREATE TABLE TABLE9 (
  rno     INTEGER      NOT NULL COMMENT '리뷰번호', -- 리뷰번호
  hno     INTEGER      NOT NULL COMMENT '병원번호', -- 병원번호
  service INTEGER      NOT NULL COMMENT '서비스', -- 서비스
  clean   INTEGER      NOT NULL COMMENT '청결도', -- 청결도
  cost    INTEGER      NOT NULL COMMENT '비용', -- 비용
  cont    LONGTEXT     NOT NULL COMMENT '내용', -- 내용
  date    DATETIME     NOT NULL DEFAULT now() COMMENT '작성일', -- 작성일
  rphoto  VARCHAR(255) NOT NULL COMMENT '영수증사진' -- 영수증사진
)
COMMENT '리뷰';

-- 리뷰
ALTER TABLE TABLE9
  ADD CONSTRAINT PK_TABLE9 -- 리뷰 기본키
    PRIMARY KEY (
      rno -- 리뷰번호
    );

ALTER TABLE TABLE9
  MODIFY COLUMN rno INTEGER NOT NULL AUTO_INCREMENT COMMENT '리뷰번호';

-- 병원사진
CREATE TABLE TABLE10 (
  hpno  INTEGER      NOT NULL COMMENT '사진번호', -- 사진번호
  hno   INTEGER      NOT NULL COMMENT '병원번호', -- 병원번호
  photo VARCHAR(255) NOT NULL COMMENT '사진' -- 사진
)
COMMENT '병원사진';

-- 병원사진
ALTER TABLE TABLE10
  ADD CONSTRAINT PK_TABLE10 -- 병원사진 기본키
    PRIMARY KEY (
      hpno -- 사진번호
    );

ALTER TABLE TABLE10
  MODIFY COLUMN hpno INTEGER NOT NULL AUTO_INCREMENT COMMENT '사진번호';

-- 마이펫사진
CREATE TABLE TABLE12 (
  phno  INTEGER      NOT NULL COMMENT '사진번호', -- 사진번호
  pno   INTEGER      NOT NULL COMMENT '마이펫번호', -- 마이펫번호
  photo VARCHAR(255) NOT NULL COMMENT '사진' -- 사진
)
COMMENT '마이펫사진';

-- 마이펫사진
ALTER TABLE TABLE12
  ADD CONSTRAINT PK_TABLE12 -- 마이펫사진 기본키
    PRIMARY KEY (
      phno -- 사진번호
    );

ALTER TABLE TABLE12
  MODIFY COLUMN phno INTEGER NOT NULL AUTO_INCREMENT COMMENT '사진번호';

-- 스크랩
CREATE TABLE TABLE13 (
  nno   INTEGER NOT NULL COMMENT '뉴스번호', -- 뉴스번호
  mno   INTEGER NOT NULL COMMENT '회원번호', -- 회원번호
  date  DATE    NOT NULL COMMENT '등록일', -- 등록일
  state INTEGER NOT NULL COMMENT '상태(스크랩)' -- 상태(스크랩)
)
COMMENT '스크랩';

-- 스크랩
ALTER TABLE TABLE13
  ADD CONSTRAINT PK_TABLE13 -- 스크랩 기본키
    PRIMARY KEY (
      nno, -- 뉴스번호
      mno  -- 회원번호
    );

-- 스크랩
ALTER TABLE TABLE13
  ADD CONSTRAINT CK_TABLE13 -- 스크랩 체크 제약
    CHECK (state = 1 or state = 0);

-- 관리자
CREATE TABLE TABLE14 (
  admin_id VARCHAR(50)  NOT NULL COMMENT 'id', -- id
  admin_pw VARCHAR(100) NOT NULL COMMENT '암호' -- 암호
)
COMMENT '관리자';

-- 관리자
ALTER TABLE TABLE14
  ADD CONSTRAINT PK_TABLE14 -- 관리자 기본키
    PRIMARY KEY (
      admin_id -- id
    );

ALTER TABLE TABLE14
  MODIFY COLUMN admin_id VARCHAR(50) NOT NULL AUTO_INCREMENT COMMENT 'id';

-- Q&A
CREATE TABLE TABLE17 (
  qno   INTEGER     NOT NULL COMMENT 'Q&A번호', -- Q&A번호
  mno   INTEGER     NULL     COMMENT '회원번호', -- 회원번호
  title VARCHAR(50) NOT NULL COMMENT '제목', -- 제목
  cont  LONGTEXT    NOT NULL COMMENT '내용', -- 내용
  date  DATETIME    NOT NULL DEFAULT now() COMMENT '작성일' -- 작성일
)
COMMENT 'Q&A';

-- Q&A
ALTER TABLE TABLE17
  ADD CONSTRAINT PK_TABLE17 -- Q&A 기본키
    PRIMARY KEY (
      qno -- Q&A번호
    );

ALTER TABLE TABLE17
  MODIFY COLUMN qno INTEGER NOT NULL AUTO_INCREMENT COMMENT 'Q&A번호';

-- 나눔장터 댓글
CREATE TABLE TABLE18 (
  srno INTEGER  NOT NULL COMMENT '번호', -- 번호
  sno  INTEGER  NOT NULL COMMENT '나눔장터번호', -- 나눔장터번호
  mno  INTEGER  NOT NULL COMMENT '회원번호', -- 회원번호
  cont LONGTEXT NOT NULL COMMENT '내용', -- 내용
  date DATETIME NOT NULL DEFAULT now() COMMENT '작성일' -- 작성일
)
COMMENT '나눔장터 댓글';

-- 나눔장터 댓글
ALTER TABLE TABLE18
  ADD CONSTRAINT PK_TABLE18 -- 나눔장터 댓글 기본키
    PRIMARY KEY (
      srno -- 번호
    );

ALTER TABLE TABLE18
  MODIFY COLUMN srno INTEGER NOT NULL AUTO_INCREMENT COMMENT '번호';

-- 우리동네 댓글
CREATE TABLE TABLE20 (
  trno INTEGER  NOT NULL COMMENT '번호', -- 번호
  tno  INTEGER  NOT NULL COMMENT '우리동네번호', -- 우리동네번호
  mno  INTEGER  NOT NULL COMMENT '회원번호', -- 회원번호
  cont LONGTEXT NOT NULL COMMENT '내용', -- 내용
  date DATETIME NOT NULL DEFAULT now() COMMENT '작성일' -- 작성일
)
COMMENT '우리동네 댓글';

-- 우리동네 댓글
ALTER TABLE TABLE20
  ADD CONSTRAINT PK_TABLE20 -- 우리동네 댓글 기본키
    PRIMARY KEY (
      trno -- 번호
    );

ALTER TABLE TABLE20
  MODIFY COLUMN trno INTEGER NOT NULL AUTO_INCREMENT COMMENT '번호';

-- Q&A댓글
CREATE TABLE TABLE21 (
  ano      INTEGER     NOT NULL COMMENT '번호', -- 번호
  qno      INTEGER     NOT NULL COMMENT 'Q&A번호', -- Q&A번호
  admin_id VARCHAR(50) NOT NULL COMMENT 'id', -- id
  cont     LONGTEXT    NOT NULL COMMENT '내용', -- 내용
  date     DATETIME    NOT NULL DEFAULT now() COMMENT '작성일' -- 작성일
)
COMMENT 'Q&A댓글';

-- Q&A댓글
ALTER TABLE TABLE21
  ADD CONSTRAINT PK_TABLE21 -- Q&A댓글 기본키
    PRIMARY KEY (
      ano -- 번호
    );

-- 병원 즐겨찾기
CREATE TABLE TABLE23 (
  mno   INTEGER NOT NULL COMMENT '회원번호', -- 회원번호
  hno   INTEGER NOT NULL COMMENT '병원번호', -- 병원번호
  state INTEGER NOT NULL COMMENT '상태(즐겨찾기)' -- 상태(즐겨찾기)
)
COMMENT '병원 즐겨찾기';

-- 병원 즐겨찾기
ALTER TABLE TABLE23
  ADD CONSTRAINT PK_TABLE23 -- 병원 즐겨찾기 기본키
    PRIMARY KEY (
      mno, -- 회원번호
      hno  -- 병원번호
    );

-- 병원 즐겨찾기
ALTER TABLE TABLE23
  ADD CONSTRAINT CK_TABLE23 -- 병원 즐겨찾기 체크 제약
    CHECK (state = 1 or state = 0);

-- 내 게시글
CREATE TABLE TABLE25 (
  mno   INTEGER NOT NULL COMMENT '회원번호', -- 회원번호
  tno   INTEGER NOT NULL COMMENT '우리동네번호', -- 우리동네번호
  sno   INTEGER NOT NULL COMMENT '나눔장터번호', -- 나눔장터번호
  state INTEGER NOT NULL COMMENT '상태(스크랩)' -- 상태(스크랩)
)
COMMENT '내 게시글';

-- 내 게시글
ALTER TABLE TABLE25
  ADD CONSTRAINT PK_TABLE25 -- 내 게시글 기본키
    PRIMARY KEY (
      mno, -- 회원번호
      tno, -- 우리동네번호
      sno  -- 나눔장터번호
    );

-- 내 게시글
ALTER TABLE TABLE25
  ADD CONSTRAINT CK_TABLE25 -- 내 게시글 체크 제약
    CHECK (state = 1 or state = 0);

-- 내 찜
CREATE TABLE TABLE26 (
  mno   INTEGER NOT NULL COMMENT '회원번호', -- 회원번호
  sno   INTEGER NOT NULL COMMENT '나눔장터번호', -- 나눔장터번호
  state INTEGER NOT NULL COMMENT '상태(찜)' -- 상태(찜)
)
COMMENT '내 찜';

-- 내 찜
ALTER TABLE TABLE26
  ADD CONSTRAINT PK_TABLE26 -- 내 찜 기본키
    PRIMARY KEY (
      mno, -- 회원번호
      sno  -- 나눔장터번호
    );

-- 내 찜
ALTER TABLE TABLE26
  ADD CONSTRAINT CK_TABLE26 -- 내 찜 체크 제약
    CHECK (state = 1 or state = 0);

-- 진찰기록
CREATE TABLE TABLE27 (
  exno    INTEGER  NOT NULL COMMENT '진찰기록번호', -- 진찰기록번호
  pno     INTEGER  NOT NULL COMMENT '마이펫번호', -- 마이펫번호
  hno     INTEGER  NOT NULL COMMENT '병원번호', -- 병원번호
  state   INTEGER  NOT NULL COMMENT '입원상태', -- 입원상태
  history LONGTEXT NOT NULL COMMENT '진찰내역' -- 진찰내역
)
COMMENT '진찰기록';

-- 진찰기록
ALTER TABLE TABLE27
  ADD CONSTRAINT PK_TABLE27 -- 진찰기록 기본키
    PRIMARY KEY (
      exno -- 진찰기록번호
    );

-- 진찰기록
ALTER TABLE TABLE27
  ADD CONSTRAINT CK_TABLE27 -- 진찰기록 체크 제약
    CHECK (state = 1 or state = 0);

ALTER TABLE TABLE27
  MODIFY COLUMN exno INTEGER NOT NULL AUTO_INCREMENT COMMENT '진찰기록번호';

-- 펫
ALTER TABLE TABLE3
  ADD CONSTRAINT FK_TABLE_TO_TABLE3 -- 회원 -> 펫
    FOREIGN KEY (
      mno -- 회원번호
    )
    REFERENCES TABLE ( -- 회원
      mno -- 회원번호
    );

-- 나눔장터
ALTER TABLE TABLE5
  ADD CONSTRAINT FK_TABLE_TO_TABLE5 -- 회원 -> 나눔장터
    FOREIGN KEY (
      mno -- 회원번호
    )
    REFERENCES TABLE ( -- 회원
      mno -- 회원번호
    );

-- 우리동네
ALTER TABLE Temporary
  ADD CONSTRAINT FK_TABLE_TO_Temporary -- 회원 -> 우리동네
    FOREIGN KEY (
      mno -- 회원번호
    )
    REFERENCES TABLE ( -- 회원
      mno -- 회원번호
    );

-- 뉴스
ALTER TABLE TABLE6
  ADD CONSTRAINT FK_TABLE14_TO_TABLE6 -- 관리자 -> 뉴스
    FOREIGN KEY (
      admin_id -- id
    )
    REFERENCES TABLE14 ( -- 관리자
      admin_id -- id
    );

-- 나눔장터사진
ALTER TABLE TABLE8
  ADD CONSTRAINT FK_TABLE5_TO_TABLE8 -- 나눔장터 -> 나눔장터사진
    FOREIGN KEY (
      sno -- 나눔장터번호
    )
    REFERENCES TABLE5 ( -- 나눔장터
      sno -- 나눔장터번호
    );

-- 리뷰
ALTER TABLE TABLE9
  ADD CONSTRAINT FK_TABLE4_TO_TABLE9 -- 병원 -> 리뷰
    FOREIGN KEY (
      hno -- 병원번호
    )
    REFERENCES TABLE4 ( -- 병원
      hno -- 병원번호
    );

-- 병원사진
ALTER TABLE TABLE10
  ADD CONSTRAINT FK_TABLE4_TO_TABLE10 -- 병원 -> 병원사진
    FOREIGN KEY (
      hno -- 병원번호
    )
    REFERENCES TABLE4 ( -- 병원
      hno -- 병원번호
    );

-- 마이펫사진
ALTER TABLE TABLE12
  ADD CONSTRAINT FK_TABLE3_TO_TABLE12 -- 펫 -> 마이펫사진
    FOREIGN KEY (
      pno -- 마이펫번호
    )
    REFERENCES TABLE3 ( -- 펫
      pno -- 마이펫번호
    );

-- 스크랩
ALTER TABLE TABLE13
  ADD CONSTRAINT FK_TABLE6_TO_TABLE13 -- 뉴스 -> 스크랩
    FOREIGN KEY (
      nno -- 뉴스번호
    )
    REFERENCES TABLE6 ( -- 뉴스
      nno -- 뉴스번호
    );

-- 스크랩
ALTER TABLE TABLE13
  ADD CONSTRAINT FK_TABLE_TO_TABLE13 -- 회원 -> 스크랩
    FOREIGN KEY (
      mno -- 회원번호
    )
    REFERENCES TABLE ( -- 회원
      mno -- 회원번호
    );

-- Q&A
ALTER TABLE TABLE17
  ADD CONSTRAINT FK_TABLE_TO_TABLE17 -- 회원 -> Q&A
    FOREIGN KEY (
      mno -- 회원번호
    )
    REFERENCES TABLE ( -- 회원
      mno -- 회원번호
    );

-- 나눔장터 댓글
ALTER TABLE TABLE18
  ADD CONSTRAINT FK_TABLE5_TO_TABLE18 -- 나눔장터 -> 나눔장터 댓글
    FOREIGN KEY (
      sno -- 나눔장터번호
    )
    REFERENCES TABLE5 ( -- 나눔장터
      sno -- 나눔장터번호
    );

-- 나눔장터 댓글
ALTER TABLE TABLE18
  ADD CONSTRAINT FK_TABLE_TO_TABLE18 -- 회원 -> 나눔장터 댓글
    FOREIGN KEY (
      mno -- 회원번호
    )
    REFERENCES TABLE ( -- 회원
      mno -- 회원번호
    );

-- 우리동네 댓글
ALTER TABLE TABLE20
  ADD CONSTRAINT FK_Temporary_TO_TABLE20 -- 우리동네 -> 우리동네 댓글
    FOREIGN KEY (
      tno -- 우리동네번호
    )
    REFERENCES Temporary ( -- 우리동네
      tno -- 우리동네번호
    );

-- 우리동네 댓글
ALTER TABLE TABLE20
  ADD CONSTRAINT FK_TABLE_TO_TABLE20 -- 회원 -> 우리동네 댓글
    FOREIGN KEY (
      mno -- 회원번호
    )
    REFERENCES TABLE ( -- 회원
      mno -- 회원번호
    );

-- Q&A댓글
ALTER TABLE TABLE21
  ADD CONSTRAINT FK_TABLE17_TO_TABLE21 -- Q&A -> Q&A댓글
    FOREIGN KEY (
      qno -- Q&A번호
    )
    REFERENCES TABLE17 ( -- Q&A
      qno -- Q&A번호
    );

-- Q&A댓글
ALTER TABLE TABLE21
  ADD CONSTRAINT FK_TABLE14_TO_TABLE21 -- 관리자 -> Q&A댓글
    FOREIGN KEY (
      admin_id -- id
    )
    REFERENCES TABLE14 ( -- 관리자
      admin_id -- id
    );

-- 병원 즐겨찾기
ALTER TABLE TABLE23
  ADD CONSTRAINT FK_TABLE_TO_TABLE23 -- 회원 -> 병원 즐겨찾기
    FOREIGN KEY (
      mno -- 회원번호
    )
    REFERENCES TABLE ( -- 회원
      mno -- 회원번호
    );

-- 병원 즐겨찾기
ALTER TABLE TABLE23
  ADD CONSTRAINT FK_TABLE4_TO_TABLE23 -- 병원 -> 병원 즐겨찾기
    FOREIGN KEY (
      hno -- 병원번호
    )
    REFERENCES TABLE4 ( -- 병원
      hno -- 병원번호
    );

-- 내 게시글
ALTER TABLE TABLE25
  ADD CONSTRAINT FK_TABLE_TO_TABLE25 -- 회원 -> 내 게시글
    FOREIGN KEY (
      mno -- 회원번호
    )
    REFERENCES TABLE ( -- 회원
      mno -- 회원번호
    );

-- 내 게시글
ALTER TABLE TABLE25
  ADD CONSTRAINT FK_Temporary_TO_TABLE25 -- 우리동네 -> 내 게시글
    FOREIGN KEY (
      tno -- 우리동네번호
    )
    REFERENCES Temporary ( -- 우리동네
      tno -- 우리동네번호
    );

-- 내 게시글
ALTER TABLE TABLE25
  ADD CONSTRAINT FK_TABLE5_TO_TABLE25 -- 나눔장터 -> 내 게시글
    FOREIGN KEY (
      sno -- 나눔장터번호
    )
    REFERENCES TABLE5 ( -- 나눔장터
      sno -- 나눔장터번호
    );

-- 내 찜
ALTER TABLE TABLE26
  ADD CONSTRAINT FK_TABLE_TO_TABLE26 -- 회원 -> 내 찜
    FOREIGN KEY (
      mno -- 회원번호
    )
    REFERENCES TABLE ( -- 회원
      mno -- 회원번호
    );

-- 내 찜
ALTER TABLE TABLE26
  ADD CONSTRAINT FK_TABLE5_TO_TABLE26 -- 나눔장터 -> 내 찜
    FOREIGN KEY (
      sno -- 나눔장터번호
    )
    REFERENCES TABLE5 ( -- 나눔장터
      sno -- 나눔장터번호
    );

-- 진찰기록
ALTER TABLE TABLE27
  ADD CONSTRAINT FK_TABLE3_TO_TABLE27 -- 펫 -> 진찰기록
    FOREIGN KEY (
      pno -- 마이펫번호
    )
    REFERENCES TABLE3 ( -- 펫
      pno -- 마이펫번호
    );

-- 진찰기록
ALTER TABLE TABLE27
  ADD CONSTRAINT FK_TABLE4_TO_TABLE27 -- 병원 -> 진찰기록
    FOREIGN KEY (
      hno -- 병원번호
    )
    REFERENCES TABLE4 ( -- 병원
      hno -- 병원번호
    );