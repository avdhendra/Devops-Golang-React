import { StrictMode } from 'react'
import { createRoot } from 'react-dom/client'
import App from './App.tsx'
import './index.css'
import { createBrowserRouter, RouterProvider } from 'react-router-dom'
import { ConfirmationPage } from './ConfirmationPage.tsx'
import { CookiesProvider } from "react-cookie";
import { LoginPage } from './LoginPage.tsx'

import { ProtectedRoute } from './ProtectedRoute.tsx'
import { RegistrationPage } from './RegistrationPage.tsx'
import { ToastContainer } from 'react-toastify'
import "react-toastify/dist/ReactToastify.css";

const router = createBrowserRouter([
  {
    path: "/feed",
    element: (
      <CookiesProvider>
        <ProtectedRoute>
          <App />
        </ProtectedRoute>
      </CookiesProvider>
    )
  },
  {
    path: "/login",
    element: (
      <CookiesProvider>
        <LoginPage />
      </CookiesProvider>
    )
  },
  {
    path: "/register",
    element: (
      <CookiesProvider>
        <RegistrationPage />
      </CookiesProvider>
    )
  },
  {
    path: "/confirm/:token",
    element: (
      <CookiesProvider>
        <ConfirmationPage />
      </CookiesProvider>
    )
  },
])

createRoot(document.getElementById('root')!).render(
  <StrictMode>
    <ToastContainer position="top-right" autoClose={3000} />
    <RouterProvider router={router} />
  </StrictMode>,
)
