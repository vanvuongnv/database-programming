<template>
  <div class="wrapper container">
    <h1>Hello VueJS</h1>
    <p>I'm a new member of Nuxt/Vue</p>
    <button type="button" class="btn btn-primary" @click="showMessage()">
      Click Me
    </button>

    <div>
      <h3>Full Name:</h3>
      <input v-model="fullName" class="form-control" />

      <p>Xin chào: {{ fullName }}</p>
    </div>
    <table class="table table-bordered">
      <tr>
        <td>Id</td>
        <td>Name</td>
        <td>Gender</td>
      </tr>

      <tr v-for="(item, index) in students" :key="index">
        <td>
          {{ item.id }}
        </td>
        <td>
          {{ item.studentName }}
        </td>
        <td>
          <span v-if="item.gender == 1"> Male </span>
          <span v-else> Female </span>
        </td>
      </tr>
    </table>
  </div>
</template>

<script>
export default {
  name: 'IndexPage',
  data() {
    return {
      fullName: '',
      students: [
        {
          id: 1,
          studentName: 'vuong',
          gender: 1,
        },
        {
          id: 2,
          studentName: 'dieu',
          gender: 2,
        },
        {
          id: 3,
          studentName: 'khue',
          gender: 2,
        },
        {
          id: 4,
          studentName: 'an',
          gender: 2,
        },
      ],
    }
  },
  methods: {
    showMessage() {
      alert('clicked')
    },
  },
}
</script>

<style scoped>
</style>
