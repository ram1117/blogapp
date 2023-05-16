first_user =
  User.create(
    name: 'Ram Kumar',
    photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
    bio:
      'I am full stack web developer. Interested in Rails as backend and React as frontend',
    posts_counter: 0
  )
second_user =
  User.create(
    name: 'Lilly',
    photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
    bio: 'Teacher from Poland.',
    posts_counter: 0
  )
third_user =
  User.create(
    name: 'Michael',
    photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
    bio: 'Engineer working in renewable energy sector.',
    posts_counter: 0
  )

first_post =
  Post.create(
    author: first_user,
    title: 'My experience learning Rails ',
    text:
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor' \
      'incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, ' \
      'quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.' \
      'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.' \
      'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    comments_counter: 0,
    likes_counter: 0
  )

Post.create(
  author: first_user,
  title: 'Using Rspec to test Rails controllers',
  text:
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor' \
    'incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, ' \
    'quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.' \
    'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.' \
    'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
  comments_counter: 0,
  likes_counter: 0
)

Post.create(
  author: first_user,
  title: 'Customizing Linux Manjaro after installation',
  text:
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor' \
    'incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, ' \
    'quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.' \
    'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.' \
    'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
  comments_counter: 0,
  likes_counter: 0
)

fourth_post =
  Post.create(
    author: first_user,
    title: 'Making the most out of LinkedIn connections',
    text:
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor' \
      'incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, ' \
      'quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.' \
      'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.' \
      'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    comments_counter: 0,
    likes_counter: 0
  )

Comment.create(
  post: fourth_post,
  author: second_user,
  text:
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod'
)
Comment.create(
  post: fourth_post,
  author: first_user,
  text:
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod'
)

Comment.create(post: fourth_post, author: first_user, text: 'test comment 1')
Comment.create(post: first_post, author: second_user, text: 'test comment 2')
Comment.create(post: first_post, author: third_user, text: 'test comment 3')

Like.create(author: first_user, post: fourth_post)
Like.create(author: second_user, post: fourth_post)
Like.create(author: third_user, post: fourth_post)
