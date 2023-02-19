#!/bin/bash

# Create the project folder
echo "Creating project folder"
mkdir /home/ubuntu/amigos

# Create the server folder
echo "Creating server folder"
mkdir /home/ubuntu/amigos/server

# Create the client folder
echo "Creating client folder"
mkdir /home/ubuntu/amigos/client

# Generate package.json for the client
echo "Generating package.json for the client"
echo '{
  "name": "amigos-client",
  "version": "1.0.0",
  "private": true,
  "dependencies": {
    "react": "^17.0.2",
    "react-dom": "^17.0.2",
    "react-router-dom": "^6.2.1"
  },
  "scripts": {
    "start": "react-scripts start",
    "build": "react-scripts build",
    "test": "react-scripts test",
    "eject": "react-scripts eject"
  }
}' >> /home/ubuntu/amigos/client/package.json

# Generate .gitignore for the client
echo "Generating .gitignore for the client"
echo 'node_modules/
build/
.DS_Store
' >> /home/ubuntu/amigos/client/.gitignore

# Generate a basic React.js app for the client
echo "Generating a basic React.js app for the client"
echo 'import React from "react";
import { BrowserRouter as Router, Switch, Route } from "react-router-dom";

function App() {
  return (
    <Router>
      <div>
        <Switch>
          <Route path="/">
            <h1>Welcome to the Support Wheel of Fate!</h1>
          </Route>
        </Switch>
      </div>
    </Router>
  );
}

export default App;' >> /home/ubuntu/amigos/client/src/App.js

# Generate index.js for the client
echo "Generating index.js for the client"
echo 'import React from "react";
import ReactDOM from "react-dom";
import App from "./App";

ReactDOM.render(
  <React.StrictMode>
    <App />
  </React.StrictMode>,
  document.getElementById("root")
);' >> /home/ubuntu/amigos/client/src/index.js

# Generate package.json for the server
echo "Generating package.json for the server"
echo '{
  "name": "amigos-server",
  "version": "1.0.0",
  "description": "Support Wheel of Fate API",
  "main": "index.js",
  "scripts": {
    "start": "dotnet run",
    "test": "dotnet test"
  },
  "dependencies": {
    "Microsoft.AspNetCore.Diagnostics.EntityFrameworkCore": "6.0.0",
    "Microsoft.AspNetCore.Identity.EntityFrameworkCore": "6.0.0",
    "Microsoft.AspNetCore.Mvc.NewtonsoftJson": "6.0.0",
    "Microsoft.EntityFrameworkCore": "6.0.0",
    "Microsoft.EntityFrameworkCore.Design": "6.0.0",
    "Microsoft.EntityFrameworkCore.Sqlite": "6.0.0",
    "Microsoft.EntityFrameworkCore.Tools": "6.0.0",
    "Swashbuckle.AspNetCore": "6.1.4"
  },
  "devDependencies": {
    "Microsoft.NET.Test.Sdk": "16.11.0",
    "Moq": "4.16.1",
    "NUnit": "3.13.2",
    "NUnit3TestAdapter": "4.0.0",
    "coverlet.collector": "3.1.0"
  },
  "license": "MIT"
}' >> /home/ubuntu/amigos/server/package.json
#Generate Startup.cs for the server
echo "Generating Startup.cs for the server"
echo 'using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;

namespace amigos
{
public class Startup
{
public Startup(IConfiguration configuration)
{
Configuration = configuration;
}
public IConfiguration Configuration { get; }

    public void ConfigureServices(IServiceCollection services)
    {
        services.AddControllers();
        services.AddSwaggerGen(c =>
        {
            c.SwaggerDoc("v1", new OpenApiInfo { Title = "amigos", Version = "v1" });
        });
    }

    public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
    {
        if (env.IsDevelopment())
        {
            app.UseDeveloperExceptionPage();
        }

        app.UseSwagger();
        app.UseSwaggerUI(c => c.SwaggerEndpoint("/swagger/v1/swagger.json", "amigos v1"));

        app.UseRouting();

        app.UseEndpoints(endpoints =>
        {
            endpoints.MapControllers();
        });
    }
}
}' >> /home/ubuntu/amigos/server/Startup.cs
#Generate Controller.cs for the server
echo "Generating Controller.cs for the server"
echo 'using Microsoft.AspNetCore.Mvc;

namespace amigos.Controllers
{
[ApiController]
[Route("[controller]")]
public class SupportController : ControllerBase
{
[HttpGet]
public ActionResult<string> Get()
{
return "Hello, world!";
}
}
}' >> /home/ubuntu/amigos/server/Controllers/SupportController.cs
#Generate Program.cs for the server
echo "Generating Program.cs for the server"
echo 'using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Hosting;

namespace amigos
{
public class Program
{
public static void Main(string[] args)
{
CreateHostBuilder(args).Build().Run();
}
    public static IHostBuilder CreateHostBuilder(string[] args) =>
        Host.CreateDefaultBuilder(args)
            .ConfigureWebHostDefaults(webBuilder =>
            {
                webBuilder.UseStartup<Startup>();
            });
}
}' >> /home/ubuntu/amigos/server/Program.cs
echo "All files and folder structure have been created!"