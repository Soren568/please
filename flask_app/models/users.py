from flask_app.config.mysqlconnection import connectToMySQL
from flask import flash
import re

DB = "recipes_schema"
EMAIL_REGEX = re.compile(r'^[a-zA-Z0-9.+_-]+@[a-zA-Z0-9._-]+\.[a-zA-Z]+$')
PW_REGEX = re.compile("^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$")

class User:
    def __init__(self, data):
        self.id = data['id']
        self.first_name = data['first_name']
        self.last_name = data['last_name']
        self.email = data['email']
        self.password = data['password']
        self.created_at = data['created_at']
        self.updated_at = data['updated_at']

    @classmethod
    def save(cls, data):
        query = "INSERT INTO users(first_name, last_name, email, password) VALUES (%(first_name)s,%(last_name)s, %(email)s,%(password)s);"
        return connectToMySQL(DB).query_db(query, data)


# ================================= VALIDATE =================================
    # Move this email regex to the top for clarity
    EMAIL_REGEX = re.compile(r'^[a-zA-Z0-9.+_-]+@[a-zA-Z0-9._-]+\.[a-zA-Z]+$')
    
    
    @staticmethod
    def validate_user(user):
        is_valid = True
        
        # Name check - works
        if len(user['first_name']) < 1 or len(user['last_name']) < 1:
            flash("Please enter your name.", 'name')
            is_valid = False

        # email check - works
        e_query = "SELECT * FROM users WHERE email = %(email)s"
        e_results = connectToMySQL(DB).query_db(e_query,user)
        if len(e_results) > 0:
            flash("Email already registered.", "email")
            is_valid = False
        elif not EMAIL_REGEX.match(user['email']):
            flash("Invalid email input.", "email")

        # Password confirmation check
        if not PW_REGEX.match(user['password']):
            flash("Password does not meet criteria. Please follow given instructions.", "pw_length")
        if user['password'] != user['pw_confirm']:
            flash("Passwords did not match.", "pw_confirm")
            is_valid = False
        return is_valid

    @staticmethod
    def get_by_email(user):
        query = "SELECT * FROM users WHERE email = %(email)s"
        results = connectToMySQL(DB).query_db(query,user)
        if len(results) < 1:
            return False
        return results[0]

# Used for session login
    @classmethod
    def get_by_id(cls, data):
        query = "SELECT * FROM users WHERE id = %(id)s;"
        print("test", data)
        results = connectToMySQL(DB).query_db(query, data)
        if not results:
            return False
        return cls(results[0])