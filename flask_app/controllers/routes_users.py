from flask import render_template, redirect, request, session, flash
from flask_app import app
from flask_app.models.users import User
from flask_app.models.recipes import Recipe
from flask_bcrypt import Bcrypt
bcrypt=Bcrypt(app)

@app.route('/')
def index():
    return redirect('/home_page')

@app.route('/home_page')
def home():
    return render_template("index.html")

# =========================== Login/Logout ==========================
@app.route('/login', methods=['POST'])
def login():
    user_data = User.get_by_email(request.form)
    if not user_data:
        flash("Email not found.", "email_not_found")
        return redirect('/')
    if not bcrypt.check_password_hash(user_data.password, request.form['password']):
        flash("Incorrect password.", "pw")
        return redirect('/')
    session['user_id'] = user_data.id
    return redirect('/dashboard')

@app.route('/logout')
def clear_session():
    session.clear()
    flash("You are logged out. Have a good day!", "logout")
    return redirect('/')
# ==================================================================

# ======================= Registration =======================
@app.route('/user/register', methods=["POST"])
def register():
    # Form validation
    if not User.validate_user(request.form):
        return redirect('/')
    else:
        print(request.form)
    #  PW hashing
        pw_hash = bcrypt.generate_password_hash(request.form['password'])
        data = {
            "first_name": request.form['first_name'],
            "last_name": request.form['last_name'],
            "email": request.form['email'],
            "password": pw_hash,
        }
        print(data)
        user_save = User.save(data)
        if user_save:
            flash("Account created! Please login with your credentials.", "success")
        else:
            flash("something went wrong", "success")
        return redirect('/')
# ============================================================






