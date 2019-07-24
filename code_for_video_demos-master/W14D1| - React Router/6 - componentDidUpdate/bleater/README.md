# Bleater

- bleats
  - id
  - body
  - author_id => references users.id

- users
  - id
  - email
  - location_id => references locations.id

- locations
  - id
  - name

