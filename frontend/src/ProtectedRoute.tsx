import type { JSX } from "react";
import { useCookies } from "react-cookie";
import { Navigate } from "react-router-dom";

export function ProtectedRoute({ children }: { children: JSX.Element }) {
  const [cookies] = useCookies(["at"]);
  if (!cookies.at) {
    return <Navigate to="/login" replace />;
  }
  return children;
}
