<template>
  <div id="login" class="text-center">
    <form class="form-signin" @submit.prevent="login">
      <p >Please Sign In</p>
      <div
        class="alert alert-danger"
        role="alert"
        v-if="invalidCredentials"
      >Invalid username and password!</div>
      <div
        class="alert alert-success"
        role="alert"
        v-if="this.$route.query.registration"
      >Thank you for registering, please sign in.</div>
      <label for="username" class="sr-only"></label>
      <input
        type="text"
        id="username"
        class="form-control"
        placeholder="Username"
        v-model="user.username"
        required
        autofocus
        
      />
      <label for="password" class="sr-only"></label>
      <input
        type="password"
        id="password"
        class="form-control"
        placeholder="Password"
        v-model="user.password"
        required
      />
      <router-link class="needAnAccount" :to="{ name: 'register' }">Need an account?</router-link>
      <button id="signInButton" type="submit">Sign in</button>
    </form>
    <div class="fade-in">
   <h1 id="stepIn">Step Into The Arena</h1>
</div>
  </div>
</template>

<script>
import authService from "../services/AuthService";

export default {
  name: "login",
  components: {},
  data() {
    return {
      user: {
        username: "",
        password: ""
      },
      invalidCredentials: false
    };
  },
  methods: {
    login() {
      authService
        .login(this.user)
        .then(response => {
          if (response.status == 200) {
            this.$store.commit("SET_AUTH_TOKEN", response.data.token);
            this.$store.commit("SET_USER", response.data.user);
            this.$router.push("/");
          }
        })
        .catch(error => {
          const response = error.response;

          if (response.status === 401) {
            this.invalidCredentials = true;
          }
        });
    }
  }
};
</script>
<style scoped>
.form-signin {
  display: flex;
  color:white;
  height: 30px;
  padding: 15px;
  margin-top: 10px;
  text-align: center;
  justify-content: space-evenly;
  align-items: center;

}

.needAnAccount {
  color: white;

}

.needAnAccount:hover {
  color: silver;
  
}

#signInButton {
  background-color: rgba(0, 0, 0, 0.15);
  color: white;
  height: 40px;
  width: 200px;
  border-radius: 4px;

}

#signInButton:hover {
  background-color: rgba(140, 0, 255, 0.75);
}
#signInButton:hover[disabled] {
    background-color:  rgba(0, 0, 0, 0.15);
    opacity:0.4;
    cursor : not-allowed !important;
}
#username {
  text-align: left;
}
#stepIn {
  color: rgba(255, 255, 255);
  display: flex;
  align-items: center;
  justify-content: center;
  text-shadow: -5px -5px 5px black;
  font-size: 60px;
  
}

.fade-in {
  animation: fadeIn ease 10s;
  -webkit-animation: fadeIn ease 10s;
  -moz-animation: fadeIn ease 10s;
  -o-animation: fadeIn ease 10s;
  -ms-animation: fadeIn ease 10s;
}
.form-control{
  height: 20px;
}
@keyframes fadeIn {
  0% {
    opacity:0;
  }
  100% {
    opacity:1;
  }
}

@-moz-keyframes fadeIn {
  0% {
    opacity:0;
  }
  100% {
    opacity:1;
  }
}

@-webkit-keyframes fadeIn {
  0% {
    opacity:0;
  }
  100% {
    opacity:1;
  }
}

@-o-keyframes fadeIn {
  0% {
    opacity:0;
  }
  100% {
    opacity:1;
  }
}

@-ms-keyframes fadeIn {
  0% {
    opacity:0;
  }
  100% {
    opacity:1;
}
}
</style>
