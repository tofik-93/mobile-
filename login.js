// app/login/page.jsx
"use client"

import { useRouter } from "next/navigation"
import { useState } from "react"
import { useAuth } from "@/auth-context"
import { Input } from "@/components/ui/input"
import { Button } from "@/components/ui/button"

export default function LoginForm() {
  const router = useRouter()
  const { login } = useAuth()
  const [email, setEmail] = useState("")
  const [password, setPassword] = useState("")

  const handleSubmit = (e) => {
    e.preventDefault()
    login({ email }) // Fake login
    router.push("/dashboard")
  }

  return (
    <div className="flex items-center justify-center h-screen bg-white">
      <form onSubmit={handleSubmit} className="space-y-4 w-full max-w-sm">
        <h1 className="text-2xl font-semibold text-center">Login</h1>
        <Input
          placeholder="Email"
          type="email"
          value={email}
          onChange={(e) => setEmail(e.target.value)}
        />
        <Input
          placeholder="Password"
          type="password"
          value={password}
          onChange={(e) => setPassword(e.target.value)}
        />
        <Button type="submit" className="w-full">Sign In</Button>
      </form>
    </div>
  )
}
