
--GROUP BY
--1. Contare quanti iscritti ci sono stati ogni anno
SELECT YEAR(enrolment_date),COUNT(*) 
FROM students
GROUP BY YEAR(enrolment_date);

--2. Contare gli insegnanti che hanno l'ufficio nello stesso edificio
SELECT office_address,COUNT(*) 
FROM teachers 
GROUP BY office_address;

--3. Calcolare la media dei voti di ogni appello d'esame
SELECT exam_id,AVG(vote) 
FROM exam_student 
GROUP BY exam_id;

--4. Contare quanti corsi di laurea ci sono per ogni dipartimento
SELECT department_id, COUNT(*) 
FROM degrees 
GROUP by department_id;

--JOIN
--1. Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia
SELECT students.*,degrees.name 
FROM degrees 
JOIN students 
ON degrees.id=students.degree_id 
WHERE degrees.name 
LIKE 'Corso di Laurea in Economia';

--2. Selezionare tutti i Corsi di Laurea Magistrale del Dipartimento di Neuroscienze
SELECT courses.name,degrees.level,departments.name 
FROM departments 
JOIN degrees ON departments.id=degrees.department_id 
JOIN courses ON degrees.id=courses.degree_id 
WHERE degrees.level LIKE 'magistrale' 
AND departments.name LIKE 'Dipartimento di Neuroscienze'

--3. Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)
SELECT courses.* 
FROM courses 
JOIN course_teacher ON courses.id=course_teacher.teacher_id 
WHERE teacher_id=44;

--4. Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e nome
SELECT students.name AS student_name, 
students.surname AS student_surname, 
degrees.name AS degree_name,
departments.name AS department_name 
FROM departments 
JOIN degrees ON departments.id=degrees.department_id 
JOIN students ON degrees.id = students.degree_id 
ORDER BY student_name ASC, student_surname ASC

--5. Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti
SELECT degrees.name AS degree_name,
courses.name AS course_name,
teachers.name AS teacher_name,
teachers.surname AS teacher_surname 
FROM degrees 
JOIN courses ON degrees.id=courses.degree_id 
JOIN course_teacher ON courses.id=course_teacher.course_id 
JOIN teachers ON course_teacher.teacher_id=teachers.id;

--6. Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54)
SELECT departments.name AS department_name, 
teachers.name as teacher_name, 
teachers.surname as teacher_surname
FROM departments 
 JOIN degrees ON departments.id=degrees.department_id 
 JOIN courses ON degrees.id=courses.degree_id 
 JOIN course_teacher ON courses.id=course_teacher.course_id 
 JOIN teachers ON course_teacher.teacher_id=teachers.id 
 WHERE departments.name LIKE 'Dipartimento di Matematica'



