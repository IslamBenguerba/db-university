--Selezionare tuti gli iscritti per anno

SELECT COUNT(`enrolment_date`) AS N_iscritti,
    YEAR(enrolment_date) as Anno
FROM students
GROUP BY YEAR(`enrolment_date`);
--Selezionare gli insegnanti che hanno l'ufficio nello stesso piano

SELECT `office_address`,
    COUNT(`id`) as N_persone
FROM `teachers`
GROUP BY `office_address`;
-- Calcolare la media dei voti di ogni appello d'esame

SELECT COUNT(`exam_student`.`exam_id`) AS 'N-appelli',
    AVG(`exam_student`.`vote`) AS 'Media_appello',
    `courses`.`name` AS 'Nome_esame'
FROM `exam_student`
    INNER JOIN `exams` ON `exam_student`.`exam_id` = `exams`.`id`
    INNER JOIN `courses` ON exams.course_id = `courses`.`id`
GROUP BY exam_id;
---Contare quanti corsi di laurea ci sono per ogni dipartimento

SELECT `departments`.`id`,
    `departments`.`name`,
    COUNT(*)
FROM `departments`
    INNER JOIN `degrees` ON `departments`.`id` = `degrees`.`department_id`
GROUP BY `departments`.`id`;
----------------------------------------------JOIN------------------------------------
--1. Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia

SELECT `department_id`,
    `degrees`.`name`,
    `students`.`name`,
    `students`.`surname`
FROM `degrees`
    INNER JOIN `students` ON `degrees`.`id` = `students`.`degree_id`
WHERE `degrees`.`name` LIKE 'Corso di Laurea in Economia%';
--Sapere tutti gli iscritti per dipartimento

SELECT `degree_id` AS `Codice_Dept`,
    COUNT(`students`.`id`) AS `N_Studenti`,
    `degrees`.`name` AS `Dipartimento`
FROM `students`
    INNER JOIN `degrees` ON `students`.`degree_id` = `degrees`.`id`
GROUP BY `degree_id`;
---2. Selezionare tutti i Corsi di Laurea Magistrale del Dipartimento diNeuroscienze

SELECT `departments.id`,
    `departments.name`,
    `degrees.name`
FROM `departments`
    INNER JOIN `degrees` ON `degrees.department_id` = `departments.id`
WHERE `departments.name` LIKE '%Neuroscienze%'
GROUP BY `departments.id`,
    `departments.name`,
    `degrees.name`;
---3 Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)

SELECT *
FROM `course_teacher`
    INNER JOIN `courses` ON `course_teacher`.`course_id` = `courses`.`id`
WHERE `teacher_id` = 44;
---4 Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e nome

SELECT `departments`.`name` AS 'Nome_dipartimento',
    `departments`.`id` AS 'Codice_Dept',
    `degrees`.`name` AS 'Nome_Corso',
    `degrees`.`id` AS 'Codice_Corso',
    `students`.`name`,
    `students`.`surname`
FROM `departments`
    INNER JOIN `degrees` ON `departments`.`id` = `degrees`.`department_id`
    INNER JOIN `students` ON `degrees`.`id` = `students`.`degree_id`
ORDER BY `students`.`surname`,
    `students`.`name`;
---5  Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti

SELECT `degrees`.`department_id` AS 'Codice_dept',
    `courses`.`name` AS 'Nome_corso',
    `degrees`.`level` AS 'Tipo_laurea',
    `degrees`.`name` AS 'Nome_laurea(Titolo)',
    `teachers`.`name` AS 'Prof_nome',
    `teachers`.`surname` AS 'Prof_cogn',
    `teachers`.`email`,
    `teachers`.`phone`
FROM `degrees`
    INNER JOIN `courses` ON `degrees`.`id` = `courses`.`degree_id`
    INNER JOIN `course_teacher` ON `courses`.`id` = `course_teacher`.`course_id`
    INNER JOIN `teachers` ON `course_teacher`.`teacher_id` = `teachers`.`id`;
---6 Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica

SELECT `departments`.`id`,
    `departments`.`name` AS 'Nome_dept',
    `degrees`.`id` AS 'Codice_laurea',
    `courses`.`name` AS 'Nome_corso',
    `teachers`.`name`,
    `teachers`.`surname`
FROM `departments`
    INNER JOIN `degrees` ON `departments`.`id` = `degrees`.`department_id`
    INNER JOIN `courses` ON `degrees`.`id` = `courses`.`degree_id`
    INNER JOIN `course_teacher` ON `courses`.`id` = `course_teacher`.`course_id`
    INNER JOIN `teachers` ON `course_teacher`.`teacher_id` = `teachers`.`id`
WHERE `departments`.`name` LIKE '% Matematica';