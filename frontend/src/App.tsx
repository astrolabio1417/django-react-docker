import React, { useEffect, useState } from 'react'

function App() {
  const [message, setMessage] = useState<string>('')

  useEffect(() => {
    const fetcher = async () => {
      try {
        const res = await fetch(`${import.meta.env.VITE_BACKEND_HOST}/message`)
        if (res.ok) {
          const data = await res.json()
          setMessage(data.message)
        } else {
          setMessage('SERVER ERROR')
        }
      } catch (e) {
        setMessage("SERVER DOWN")
      }
    }
    fetcher()
  }, [])

  return (
    <div className="App">
      <h1>VITE + REACT TS!</h1>
      <p>Backend Message: {message}</p>
    </div>
  )
}

export default App
