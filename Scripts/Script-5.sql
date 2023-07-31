SELECT D.DEPT_CODE, DEPT_NAME, COUNT(MEMBER_ID) AS DEPT_COUNT
FROM DEPARTMENT_TB D LEFT JOIN MEMBER_TB M ON D.DEPT_CODE=M.DEPT_CODE
GROUP BY D.DEPT_CODE, DEPT_NAME
ORDER BY D.DEPT_CODE ASC;

SELECT JOB_CODE, JOB_NAME, COUNT(*) AS JOB_COUNT
		FROM MEMBER_TB JOIN JOB_TB USING(JOB_CODE)
		GROUP BY JOB_CODE, JOB_NAME
		ORDER BY JOB_CODE ASC;
SELECT * FROM JOB_TB;
ALTER TABLE JOB_TB ADD JOB_AUTH VARCHAR2(50);
UPDATE JOB_TB SET JOB_AUTH='EMP' WHERE JOB_CODE='J4';
COMMIT;
SELECT * FROM MEMBER_TB JOIN DEPARTMENT_TB USING(DEPT_CODE);
SELECT * FROM DEPARTMENT_TB;
INSERT INTO DEPARTMENT_TB VALUES('D6','홍보1팀');
UPDATE MEMBER_TB SET DEPT_CODE='D1' WHERE JOB_CODE='J1';
SELECT * FROM MEMBER_TB;
ALTER TABLE MEMBER_TB DROP CONSTRAINT MEMBER_JOB_FK;
ALTER TABLE MEMBER_TB DROP CONSTRAINT SYS_C0071624;
ALTER TABLE MEMBER_TB MODIFY JOB_CODE CONSTRAINT MEMBER_JOB_FK REFERENCES JOB_TB(JOB_CODE) ON DELETE SET NULL;
ROLLBACK;
UPDATE DEPARTMENT_TB SET DEPT_NAME='영업팀' WHERE DEPT_CODE='D6';

UPDATE MEMBER_TB SET PROFILE_IMG='DEFAULT_PROFILE.png';

ALTER TABLE MEMBER_TB ADD(SUB_ADDRESS VARCHAR2(100));
UPDATE MEMBER_TB SET SUB_ADDRESS='KM타워 304호';
UPDATE MEMBER_TB SET ADDRESS='서울 금천구 가산로 70' WHERE MEMBER_ID IN('23072817','23072118','23072819');