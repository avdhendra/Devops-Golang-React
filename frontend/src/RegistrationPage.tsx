import { useState } from "react";
import { API_URL } from "./api";
import { useNavigate } from "react-router-dom";
import {toast} from 'react-toastify'

export function RegistrationPage() {
  const [username, setUsername] = useState("");
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const redirect = useNavigate();

  const handleSubmit = async(e: React.FormEvent) => {
    e.preventDefault();
    console.log({ username, email, password });
    // TODO: Send data to backend API
     try {
          const data = await fetch(`${API_URL}/authentication/user`, {
            method: "POST",
            body: JSON.stringify({username, email, password }),
          })
    
          const out = await data.json()
          if(!data.ok){
            throw new Error(out.error)
          }
    
          console.log(out)
          toast.success("User registerd Successfully")
    
          redirect("/login")
        // eslint-disable-next-line @typescript-eslint/no-explicit-any
        } catch (error:any) {
          toast.error(error.message)
        }
  };

  return (
    <div className="registration-container">
      <div className="registration-card">
        <h2 className="registration-title">Create Account</h2>

        <form onSubmit={handleSubmit} className="registration-form">
          <div className="form-group">
            <label>Username</label>
            <input
              type="text"
              placeholder="Enter your username"
              value={username}
              onChange={(e) => setUsername(e.target.value)}
              required
              className="form-inputfield"
            />
          </div>

          <div className="form-group">
            <label>Email</label>
            <input
              type="email"
              placeholder="Enter your email"
              value={email}
              onChange={(e) => setEmail(e.target.value)}
              required
              className="form-inputfield"
            />
          </div>

          <div className="form-group">
            <label>Password</label>
            <input
              type="password"
              placeholder="Enter your password"
              value={password}
              onChange={(e) => setPassword(e.target.value)}
              required
              className="form-inputfield"
            />
          </div>

          <button type="submit" className="btn-submit">
            Register
          </button>
        </form>

        <p className="registration-footer">
          Already have an account?{" "}
          <a href="/login" className="login-link">
            Login here
          </a>
        </p>
      </div>
    </div>
  );
}
