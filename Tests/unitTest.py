import pytest
import mysql.connector

@pytest.fixture
def db_connection():
    conn = mysql.connector.connect(
        host="localhost",
        port="3306",
        password="EoMApassword",
        database="EoMA"
    )
    yield conn
    conn.close()

def test_all_committee_lecturers_exist(db_connection):
    cursor = db_connection.cursor()
    cursor.execute("""
        SELECT COUNT(*) FROM committees c
        LEFT JOIN lecturers l ON c.lecturer_id = l.id
        WHERE l.id IS NULL;
    """)
    result = cursor.fetchone()[0]
    assert result == 0, "There are committees with invalid lecturer_id"

def test_all_research_projects_have_lecturer_as_principal_investigator(db_connection):
    cursor = db_connection.cursor()
    cursor.execute("""
        SELECT COUNT(*) FROM researchProjects rp
        LEFT JOIN lecturers l ON rp.principle_investigator = l.id
        WHERE rp.principle_investigator IS NOT NULL AND l.id IS NULL;`
    """)
    result = cursor.fetchone()[0]
    assert result == 0, "There are departments with invalid head_id"

def test_all_lectuers_have_valid_department(db_connection):
    cursor = db_connection.cursor()
    cursor.execute("""
        SELECT COUNT(*) FROM lecturers l
        LEFT JOIN departments d ON l.department = d.id
        WHERE d.id IS NULL;
    """)
    result = cursor.fetchone()[0]
    assert result == 0, "There are courses with invalid department_id"

def test_enrolment_links_valid_student_and_course(db_connection):
    cursor = db_connection.cursor()
    cursor.execute("""
        SELECT COUNT(*) FROM enrolment e
        LEFT JOIN students s ON e.student_id = s.id
        LEFT JOIN courses c ON e.course_id = c.id
        WHERE s.id IS NULL OR c.id IS NULL;
    """)
    result = cursor.fetchone()[0]
    assert result == 0, "There are enrolments with invalid student_id or course_id"

def test_all_disciplinary_actions_have_valid_student(db_connection):
    cursor = db_connection.cursor()
    cursor.execute("""
        SELECT COUNT(*) FROM disciplinaries d
        LEFT JOIN students s ON d.student_id = s.id
        WHERE s.id IS NULL;
    """)
    result = cursor.fetchone()[0]
    assert result == 0, "There are disciplinaries with invalid student_id"
