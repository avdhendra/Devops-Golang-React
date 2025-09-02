import useSWR, { mutate } from 'swr'
import './App.css'
import {  Post, type FeedPost } from './Post'
import { useCookies } from 'react-cookie'
import { useNavigate } from 'react-router-dom'
import gohper from './assets/gohper.svg'
import { CreatePostForm } from './CreatePostForm'
import { fetcher } from './api'



function App() {
  const [cookies, setCookie] = useCookies(['at']);
  const at = cookies.at;

  const redirect = useNavigate();

  const { data, error, isLoading } = useSWR<{ data: FeedPost[] }>(
  at ? '/users/feed' : null,
  at ? fetcher(at) : null
)

const reFetchData = () => {
  mutate('/users/feed');
};


  if (error) return <div>failed to load</div>
  if (isLoading) return <div>loading...</div>

  const posts = data?.data ?? []

  const handleLogout = () => {
    setCookie("at", "")
    redirect("/")
    return
  }

  

  const handleClickPost = (id: number) => () => redirect(`/post/${id}`)

  return (
    <div>
      <nav className='nav'>
        <div className='logo-container'>
          <img src={gohper} className="logo" />
          <h1>GopherSocial</h1>
        </div>

        <button onClick={handleLogout}>Logout</button>
      </nav>

      <p>This is a social media platform for gophers.</p>

      <CreatePostForm onFetchPosts={reFetchData} />

      <div className='posts'>
        {posts.map(post => (
          <Post key={post.id} post={post} onClick={handleClickPost(post.id)} />
        ))}

        {posts.length === 0 && <p>No posts yet, start following someone or post something</p>}
      </div>

    </div>
  )
}

export default App
