<template>
  <div class="wrapper container">
    <h1>Hello VueJS</h1>
    <p>I'm a new member of Nuxt/Vue</p>
    <button type="button" class="btn btn-primary" @click="showMessage()">
      Click Me
    </button>
    <div class="row">
      <div class="col-12 col-md-4">
        <!--Form-->
        <form>
          <div class="form-group mb-3">
            <label for="id" class="control-label"> Id </label>
            <input v-model="dataSubmit.id" class="form-control" id="id" />
          </div>
          <div class="form-group mb-3">
            <label for="fullName" class="control-label"> Full Name </label>
            <input
              v-model="dataSubmit.fullName"
              class="form-control"
              id="fullName"
            />
          </div>
          <div class="form-group mb-3">
            <label for="gender" class="control-label"> Gender </label>
            <select
              v-model="dataSubmit.gender"
              id="gender"
              class="form-control"
            >
              <option
                v-for="(genderOption, index) in genderOptions"
                :key="index"
                :value="genderOption.id"
              >
                {{ genderOption.text }}
              </option>
            </select>
          </div>
        </form>
      </div>
      <div class="col-12 col-md-8">
        <!--Table-->
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
    </div>
    <div>
      <h3>Full Name:</h3>
      <input v-model="fullName" class="form-control" />

      <p>Xin chào: {{ fullName }}</p>
    </div>
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
      dataSubmit: {
        id: null,
        fullName: '',
        gender: null,
      },
      genderOptions: [
        { id: 1, text: 'Male' },
        { id: 2, text: 'Female' },
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
