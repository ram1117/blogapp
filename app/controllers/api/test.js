fetch("http://127.0.0.1:3000/api/users/1/posts/30/comments/",
{ method: "POST", 
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({user_id:1,post_id:2,text:"api test comment 1"})}
);