<template>
  <div id="register" class="container transparent-background text-center d-flex justify-content-center">
    <form class="form-register" @submit.prevent="register">
      <h1 class="mb-3 font-weight-normal">Create Account</h1>
      <div class="alert alert-danger" role="alert" v-if="registrationErrors">
        {{ registrationErrorMsg }}
      </div>
      <div class="form-group">
        <input
          type="text"
          id="username"
          class="form-control"
          placeholder="Username"
          v-model="user.username"
          required
          autofocus />
      </div>
      <div class="form-group">
        <input
          type="text"
          id="firstName"
          class="form-control"
          placeholder="First Name"
          v-model="user.firstName"
          required
          />
      </div>
      <div class="form-group">
        <input
          type="text"
          id="lastName"
          class="form-control"
          placeholder="Last Name"
          v-model="user.lastName"
          required
          />
      </div>
      <div class="form-group">
        <input
          type="password"
          id="password"
          class="form-control"
          placeholder="Password"
          v-model="user.password"
          required />
      </div>
      <div class="form-group">
        <input
          type="password"
          id="confirmPassword"
          class="form-control"
          placeholder="Confirm Password"
          v-model="user.confirmPassword"
          required />
      </div>
      <div class="form-group login">
        <router-link :to="{ name: 'login' }">Have an account?</router-link>
      </div>
      <button class="btn btn-primary" type="submit">
        Create Account
      </button>
    </form>
  </div>
</template>

<script>
import authService from '../services/AuthService';

export default {
  name: 'register',
  data() {
    return {
      user: {
        username: '',
        password: '',
        confirmPassword: '',
        role: 'user',
      },
      registrationErrors: false,
      registrationErrorMsg: 'There were problems registering this user.',
    };
  },
  methods: {
    register() {
      if (this.user.password != this.user.confirmPassword) {
        this.registrationErrors = true;
        this.registrationErrorMsg = 'Password & Confirm Password do not match.';
      } else {
        authService
          .register(this.user)
          .then((response) => {
            if (response.status == 201) {
              this.$router.push({
                name: 'login',
                query: { registration: 'success' },
              });
            }
          })
          .catch((error) => {
            const response = error.response;
            this.registrationErrors = true;
            if (response.status === 400) {
              this.registrationErrorMsg = 'Bad Request: Validation Errors';
            }
          });
      }
    },
    clearErrors() {
      this.registrationErrors = false;
      this.registrationErrorMsg = 'There were problems registering this user.';
    },
  },
};
</script>

<style>
  #register {
    min-height: 70vh;
    margin-top:8vh;
  }

  .login {
    background-color: #f1f0f0a2;
    border-radius: 4px;
  }

  .transparent-background {
     background-color: #222222a2;
     border-radius: 4px;
     max-width: 25%;
     margin-bottom: 8vh;
  }
</style>
