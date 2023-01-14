import { useContext, useState } from "react";
import "./login.css";
import { signInWithEmailAndPassword } from "firebase/auth";
import { auth } from "../../firebase";
import { useNavigate } from "react-router-dom";
import { AuthContext } from "../../context/AuthContext";

const Login = () => {
  const [error, setError] = useState(false);
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");

  const navitage = useNavigate();

  const { dispatch } = useContext(AuthContext);

  const handleLogin = (e) => {
    e.preventDefault();

    signInWithEmailAndPassword(auth, email, password)
      .then((userCredential) => {
        // Signed in
        const user = userCredential.user;
        dispatch({ type: "LOGIN", payload: user });
        navitage("/");
      })
      .catch((error) => {
        setError(true);
      });
  };

  return (
    <div class="container">
      <form id="contact" onSubmit={handleLogin}>
        <h3>Admin Login</h3>
        <fieldset>
          <input
            placeholder="Your Email Address"
            type="email"
            tabindex="1"
            onChange={(e) => setEmail(e.target.value)}
            autofocus
            required
          />
        </fieldset>
        <fieldset>
          <input
            placeholder="Your Password"
            type="password"
            tabindex="2"
            onChange={(e) => setPassword(e.target.value)}
            required
          />
        </fieldset>
        <fieldset>
          <button
            name="submit"
            type="submit"
            id="contact-submit"
            data-submit="...Sending"
          >
            Submit
          </button>
        </fieldset>
        {error && <span>Wrong email or password!</span>}
      </form>
    </div>
  );
};

export default Login;
