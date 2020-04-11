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

@Component
export default class UsersList extends Vue {
  users: any[] = [];

  user: any = {
      name: '',
      email: ''
  }

  apiBase = `${process.env.VUE_APP_API_HOST}/users`;

  created() {
    this.loadUsers();
  }

  async loadUsers() {
    const response = await fetch(this.apiBase);
    this.users = await response.json();
  }

  async saveUser() {
    const response = await fetch(this.apiBase, {
        method: 'POST',
        body: JSON.stringify(this.user)
    })

    const user = await response.json();

    this.users.push(user);
  }
}
</script>