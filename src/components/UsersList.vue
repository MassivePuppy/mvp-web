<template>
  <div>
    <div>
        <div v-for="user in users" v-bind:key="user.key">
            {{ user._id }} | {{ user.name }} | {{ user.email }}
        </div>
      <hr />
    </div>
    <input v-model="user.name"/>
    <input v-model="user.email"/>
    
    <button v-on:click="saveUser">Save</button>
  </div>
</template>

<script lang="ts">
import Vue from "vue";
import Component from "vue-class-component";
import axios from "axios";

@Component
export default class UsersList extends Vue {
  users: any[] = [];

  user: any = {
      name: '',
      email: ''
  }

  apiBase = "http://192.168.99.100:3000/users"

  created() {
    this.loadUsers();
  }

  loadUsers() {
    axios.get(this.apiBase).then((response: any) => {
      this.users = response.data
    });
  }

  saveUser() {
    axios.post(this.apiBase, this.user).then((response: any) => {
      this.users.push(response.data)
    });
  }
}
</script>