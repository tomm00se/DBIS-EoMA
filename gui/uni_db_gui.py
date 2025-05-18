import tkinter as tk
from tkinter import ttk, simpledialog, messagebox
import mysql.connector

# Function to establish a connection to the MySQL database
# This assumes docker container is already running with the parameters in the github readme file
def connect_db():
    return mysql.connector.connect(
        host="localhost",
        port=3306,
        user="root",
        password="EoMApassword",
        database="EoMA"
    )

# Main application class for the University Database GUI
class UniversityDBApp:
    def __init__(self, root):
        # Establish database connection
        self.conn = connect_db()
        self.root = root

        # Configure the main window
        self.root.title("University Query Interface")  # Window title
        self.root.geometry("1000x950")  # Initial window size

        # List of queries with corresponding functions
        self.query_list = [
            ("Students in a course with a specific lecturer", self.query_students_by_course_and_lecturer),
            ("Final-year students with grade > 70%", self.query_final_year_above_70),
            ("Students not registered this semester", self.query_unenrolled_students),
            ("Faculty advisor contact info", self.query_faculty_advisor),
            ("Lecturers by research/expertise", self.query_lecturers_by_expertise),
            ("Courses by department", self.query_courses_by_department),
            ("Lecturers supervising most research projects", self.query_top_research_supervisors),
            ("Lecturer publications in 2024", self.query_recent_publications),
            ("Students advised by a lecturer", self.query_students_by_advisor),
            ("All staff in a department", self.query_all_staff_in_department),
            ("Supervisors in a program", self.query_supervisors_by_program),
        ]

        # Create the GUI widgets
        self.create_widgets()

    # Method to create and configure the GUI widgets
    def create_widgets(self):
        style = ttk.Style()
        style.theme_use("clam")  # Use the 'clam' theme

        # Define colours for the dark theme
        dark_bg = "#1e1e1e"  # Background colour
        mid_bg = "#2d2d2d"   # Mid-tone background for frames
        highlight = "#007acc"  # Highlight colour (blue)
        text_fg = "#ffffff"  # Text colour (white)

        # Configure the main window background
        self.root.configure(bg=dark_bg)

        # Configure button styles
        style.element_create("RoundedButton", "from", "clam")
        style.layout("Rounded.TButton", [
            ("Button.border", {"sticky": "nswe", "children": [
                ("Button.focus", {"sticky": "nswe", "children": [
                    ("Button.padding", {"sticky": "nswe", "children": [
                        ("Button.label", {"sticky": "nswe"})
                    ]})
                ]})
            ]})
        ])
        style.configure("Rounded.TButton",
            background=highlight,
            foreground="#ffffff",
            font=("Segoe UI", 11, "bold"),
            padding=10,
            relief="flat"
        )
        style.map("Rounded.TButton",
            background=[("active", "#005f99")]
        )

        # Configure other widget styles
        style.configure("TFrame", background=mid_bg)
        style.configure("TLabel", background=mid_bg, foreground=text_fg, font=("Segoe UI", 12))
        style.configure("TCombobox", fieldbackground=mid_bg, background=dark_bg, foreground=text_fg)

        # Main frame to hold all widgets
        main_frame = ttk.Frame(self.root, padding=20)
        main_frame.pack(fill=tk.BOTH, expand=True)

        # Title label at the top of the window
        title_label = ttk.Label(main_frame, text="🎓 University Query Interface", font=("Segoe UI", 18, "bold"), foreground=highlight)
        title_label.pack(pady=10)

        # Frame for query buttons
        button_frame = ttk.Frame(main_frame, padding=10)
        button_frame.pack(fill=tk.BOTH, expand=False)

        # Add buttons for each query
        for text, func in self.query_list:
            btn = ttk.Button(button_frame, text=text, command=func, style="Rounded.TButton")
            btn.pack(pady=6, anchor="w", fill=tk.X)

        # Frame for displaying query results
        result_frame = ttk.Frame(main_frame, padding=10)
        result_frame.pack(fill=tk.BOTH, expand=True)

        # Label for the results section
        result_label = ttk.Label(result_frame, text="Query Results:", font=("Segoe UI", 12, "bold"), foreground=highlight)
        result_label.pack(anchor="w", pady=5)

        # Text box to display query results
        self.result_box = tk.Text(
            result_frame,
            wrap=tk.NONE,
            height=25,
            width=100,
            font=("Consolas", 10),
            bg="#1e1e1e",
            fg="#d4d4d4",
            insertbackground="#ffffff",
            borderwidth=0,
            highlightthickness=1,
            relief="flat"
        )
        self.result_box.pack(fill=tk.BOTH, expand=True, pady=5)

        # Scrollbars for the results box (both axex)
        scrollbar_y = ttk.Scrollbar(result_frame, orient=tk.VERTICAL, command=self.result_box.yview)
        scrollbar_y.pack(side=tk.RIGHT, fill=tk.Y)
        self.result_box.configure(yscrollcommand=scrollbar_y.set)

        scrollbar_x = ttk.Scrollbar(result_frame, orient=tk.HORIZONTAL, command=self.result_box.xview)
        scrollbar_x.pack(side=tk.BOTTOM, fill=tk.X)
        self.result_box.configure(xscrollcommand=scrollbar_x.set)

    # Method to execute a query and return results
    def run_query(self, query, params=()):
        cursor = self.conn.cursor()
        cursor.execute(query, params)
        return cursor.fetchall(), [desc[0] for desc in cursor.description]

    # Method to display query results in the results box
    def display_results(self, rows, headers):
        self.result_box.delete("1.0", tk.END)  # Clear the results box
        if not rows:
            self.result_box.insert(tk.END, "No results found.")
            return
        header_line = " | ".join(headers)
        self.result_box.insert(tk.END, header_line + "\n")
        self.rk.END, "-" * len(header_line) + "\n")
        for row in rows:
            self.result_box.insert(tk.END, " | ".join(map(str, row)) + "\n")

    # Method to create a dropdown pop-up for user input
    
    # This allows a sql query to be passed when each button is pushed
    # so the results can serve as relevant values for the user to select from
    def get_dropdown_value(self, query, label="Select an option"):
        win = tk.Toplevel(self.root)
        win.title("Select")
        win.configure(bg="#2d2d2d")

        ttk.Label(win, text=label).pack(pady=5)

        cursor = self.conn.cursor()
        cursor.execute(query)
        rows = cursor.fetchall()

        if not rows:
            messagebox.showinfo("No Options", f"No available entries for: {label}")
            win.destroy()
            return None

        options = [f"{row[0]} - {row[1]}" for row in rows]
        value_map = {opt: row[0] for opt, row in zip(options, rows)}

        var = tk.StringVar()
        combo = ttk.Combobox(win, textvariable=var, values=options, state="readonly", width=50)
        combo.pack(pady=5)

        result = {}

        def submit():
            selected = var.get()
            if selected in value_map:
                result["value"] = value_map[selected]
                win.destroy()
            else:
                messagebox.showerror("Invalid selection", "Please select a value.")

        ttk.Button(win, text="OK", command=submit, style="Rounded.TButton").pack(pady=5)
        win.wait_window()
        return result.get("value")

    # Method to prompt the user for free-text input
    def prompt(self, prompt_text):
        return simpledialog.askstring("Input", prompt_text, parent=self.root)

    # ---------- QUERY FUNCTIONS ----------
    # Each function below corresponds to a specific query in the GUI

    # Query: Students in a course with a specific lecturer
    def query_students_by_course_and_lecturer(self):
        course_id = self.get_dropdown_value(
            "SELECT id, name FROM courses", "Select Course:"
        )
        if not course_id:
            return

        cursor = self.conn.cursor()
        cursor.execute("""
            SELECT DISTINCT l.id, l.name
            FROM lecturers l
            JOIN enrolment e ON l.id = e.lecturer_id
            WHERE e.course_id = %s
        """, (course_id,))
        lecturer_options = cursor.fetchall()

        if not lecturer_options:
            messagebox.showinfo("No Lecturers", "No lecturers are currently assigned to this course.")
            return

        win = tk.Toplevel(self.root)
        win.title("Select Lecturer")
        win.configure(bg="#2d2d2d")

        ttk.Label(win, text="Select Lecturer for This Course:").pack(pady=5)
        options = [f"{lid} - {name}" for lid, name in lecturer_options]
        values_map = {opt: lid for opt, (lid, name) in zip(options, lecturer_options)}

        var = tk.StringVar()
        combo = ttk.Combobox(win, textvariable=var, values=options, state="readonly", width=50)
        combo.pack(pady=5)

        result = {}

        def submit():
            selected = var.get()
            if selected in values_map:
                result["value"] = values_map[selected]
                win.destroy()
            else:
                messagebox.showerror("Invalid selection", "Please select a lecturer.")

        ttk.Button(win, text="OK", command=submit, style="Rounded.TButton").pack(pady=5)
        win.wait_window()
        lecturer_id = result.get("value")
        if not lecturer_id:
            return

        query = """
            SELECT s.id, s.name, s.email, s.year_of_study
            FROM students s
            JOIN enrolment e ON s.id = e.student_id
            WHERE e.course_id = %s AND e.lecturer_id = %s
        """
        rows, headers = self.run_query(query, (course_id, lecturer_id))
        self.display_results(rows, headers)

    # Query: Final-year students with mark > 70%
    def query_final_year_above_70(self):
        query = """
            SELECT s.id, s.name, s.email, s.grade
            FROM students s
            WHERE s.year_of_study = 4 AND s.grade > 70
        """
        rows, headers = self.run_query(query)
        self.display_results(rows, headers)

    # Query: Students not registered this semester
    def query_unenrolled_students(self):
        semester = self.get_dropdown_value(
            "SELECT DISTINCT semester, semester FROM enrolment ORDER BY semester",
            "Select Semester:"
        )
        if not semester:
            return
        query = """
            SELECT s.id, s.name, s.email
            FROM students s
            WHERE s.id NOT IN (
                SELECT DISTINCT e.student_id
                FROM enrolment e
                WHERE e.semester = %s
            )
        """
        rows, headers = self.run_query(query, (semester,))
        self.display_results(rows, headers)


    # Query: Faculty advisor contact info
    def query_faculty_advisor(self):
        student_id = self.get_dropdown_value(
            "SELECT id, name FROM students ORDER BY name",
            "Select Student:"
        )

        if not student_id:
            return
        query = """
            SELECT l.name, l.email, l.contact_number
            FROM lecturers l
            JOIN students s ON l.id = s.advised_by
            WHERE s.id = %s
        """
        rows, headers = self.run_query(query, (student_id,))
        self.display_results(rows, headers)

    # Query: Lecturers by research/expertise
    def query_lecturers_by_expertise(self):
        keyword = self.get_dropdown_value(
            """
            SELECT DISTINCT expertise, expertise FROM lecturers
            UNION
            SELECT DISTINCT research_interests, research_interests FROM lecturers
            """,
            "Select Expertise/Interest:"
        )
        like_pattern = f"%{keyword}%"
        if not keyword:
            return
        like_pattern = f"%{keyword}%"
        query = """
            SELECT id, name, email, expertise, research_interests
            FROM lecturers
            WHERE expertise LIKE %s OR research_interests LIKE %s
        """
        rows, headers = self.run_query(query, (like_pattern, like_pattern))
        self.display_results(rows, headers)

    # Query: Courses by department
    def query_courses_by_department(self):
        department_id = self.get_dropdown_value(
            "SELECT id, name FROM departments", "Select Department:"
        )
        if not department_id:
            return
        query = """
            SELECT c.id, c.name, c.description, c.level, c.credits
            FROM courses c
            JOIN enrolment e ON c.id = e.course_id
            JOIN lecturers l ON e.lecturer_id = l.id
            WHERE l.department = %s
            GROUP BY c.id, c.name, c.description, c.level, c.credits
        """
        rows, headers = self.run_query(query, (department_id,))
        self.display_results(rows, headers)

    # Query: Lecturers supervising most research projects
    def query_top_research_supervisors(self):
        query = """
            SELECT l.id, l.name, COUNT(r.id) as project_count
            FROM lecturers l
            JOIN researchProjects r ON l.id = r.principle_investigator
            GROUP BY l.id, l.name
            ORDER BY project_count DESC
        """
        rows, headers = self.run_query(query)
        self.display_results(rows, headers)

    # Query: Lecturer publications in 2024
    def query_recent_publications(self):
        query = """
            SELECT l.id, l.name, l.publications
            FROM lecturers l
            WHERE l.publications LIKE '%%2024%%'
        """
        rows, headers = self.run_query(query)
        self.display_results(rows, headers)

    # Query: Students advised by a lecturer
    def query_students_by_advisor(self):
        lecturer_id = self.get_dropdown_value(
            "SELECT id, name FROM lecturers", "Select Lecturer:"
        )
        if not lecturer_id:
            return
        query = """
            SELECT s.id, s.name, s.email, s.year_of_study
            FROM students s
            WHERE s.advised_by = %s
        """
        rows, headers = self.run_query(query, (lecturer_id,))
        self.display_results(rows, headers)

    # Query: All staff in a department
    def query_all_staff_in_department(self):
        department_id = self.get_dropdown_value(
            "SELECT id, name FROM departments", "Select Department:"
        )
        if not department_id:
            return
        query = """
            SELECT 'Academic' as staff_type, id, name, email, contact_number
            FROM lecturers
            WHERE department = %s
            UNION
            SELECT 'Non-Academic', id, name, contact_details, job_title
            FROM nonAcademicStaff
            WHERE department = %s
        """
        rows, headers = self.run_query(query, (department_id, department_id))
        self.display_results(rows, headers)

    # Query: Supervisors in a program
    def query_supervisors_by_program(self):
        program_id = self.get_dropdown_value(
            "SELECT id, name FROM programs", "Select Program:"
        )
        if not program_id:
            return
        query = """
            SELECT DISTINCT
                CASE
                    WHEN sv.lecturer_id IS NOT NULL THEN l.name
                    WHEN sv.nonAcademicStaff_id IS NOT NULL THEN nas.name
                END as supervisor_name,
                CASE
                    WHEN sv.lecturer_id IS NOT NULL THEN 'Academic'
                    WHEN sv.nonAcademicStaff_id IS NOT NULL THEN 'Non-Academic'
                END as supervisor_type,
                p.name as program_name
            FROM program_enrolment pe
            JOIN supervisors sv ON pe.supervisor_id = sv.id
            JOIN programs p ON pe.program_id = p.id
            LEFT JOIN lecturers l ON sv.lecturer_id = l.id
            LEFT JOIN nonAcademicStaff nas ON sv.nonAcademicStaff_id = nas.id
            WHERE p.id = %s
        """
        rows, headers = self.run_query(query, (program_id,))
        self.display_results(rows, headers)

# Start the application
root = tk.Tk()
app = UniversityDBApp(root)
root.mainloop()
