<template>
  <div class="home">
    <img alt="Vue logo" src="../assets/logo.png">
    <UsersList />
  </div>
</template>

<script>

import UsersList from '@/components/UsersList.vue'

export default {
  name: 'Users',
  components: {
    UsersList
  }
}
</script>
