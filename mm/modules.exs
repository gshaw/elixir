:io.format("~.2f", [-0.623278]) # Format float as string (2 decimals)

System.get_env("USER")
Path.extname("dave/test.exs")
System.cwd

# Using JSON package
JSON.decode(~s({"name": "Devin Torres", "age": 27}))

# Using Poison package
Poison.Parser.parse!(~s({"name": "Devin Torres", "age": 27}))

System.cmd("uptime", [])
