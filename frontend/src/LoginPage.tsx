import { useState } from "react"

import { useNavigate } from "react-router-dom"
import { useCookies } from "react-cookie"
import { API_URL } from "./api"
import { toast } from "react-toastify"

export const LoginPage: React.FC = () => {
  const [email, setEmail] = useState("")
  const [password, setPassword] = useState("")
  const redirect = useNavigate();
  // eslint-disable-next-line @typescript-eslint/no-unused-vars
  const [_, setCookie] = useCookies(['at']);


  const handleLogin = async () => {
    try {
      const data = await fetch(`${API_URL}/authentication/token`, {
        method: "POST",
        body: JSON.stringify({ email, password }),
      })

      const out = await data.json()
      setCookie("at", out.data)
      if(!data.ok){
        throw new Error(out.error)
      }
      console.log(out)

      redirect("/feed")
    // eslint-disable-next-line @typescript-eslint/no-explicit-any
    } catch (error:any) {
      toast.error(error.message)
    }
  }


  return (
    <div className="login-container">
      <div className="login-card">
        <h1 className="login-title">Login to GopherSocial</h1>
<div className="form-group">

        <input
          className="login-input"
          placeholder="Email"
          value={email}
          onChange={(e) => setEmail(e.target.value)}
        />
 </div>
  <div className="form-group">

        <input
          type="password"
          className="login-input"
          placeholder="Password"
          value={password}
          onChange={(e) => setPassword(e.target.value)}
        />
 

  </div>

        <button className="login-button" onClick={handleLogin}>
          Login
        </button>

        <button
          className="register-button"
          onClick={() => redirect("/register")}
        >
          Register
        </button>
      </div>
    </div>);
}