<template>
  <v-container fill-height fluid grid-list-xl>
    <v-layout justify-center wrap>
      <v-flex md12>
        <material-card color="purple" title="List of salons" text="Manage account of all salons">
          <v-card-title>
            <v-spacer></v-spacer>
            <v-text-field
              v-model="salonDatatable.search"
              append-icon="search"
              label="search"
              color="purple"
              single-line
              hide-details
            ></v-text-field>
          </v-card-title>
          <v-data-table
            :headers="salonDatatable.headers"
            :items="salonDatatable.salons"
            :search="salonDatatable.search"            
            class="elevation-1 salon-table">
          >
            <template slot="headerCell" slot-scope="{ header }">
              <span
                class="subheading font-weight-bold text--purple text--darken-3"
                v-text="header.text"
              />
            </template>
            <template slot="items" slot-scope="{ item }">
              <td>{{ item.name }}</td>
              <td>{{ item.phone }}</td>
              <td>{{ item.email }}</td>
              <td>{{ item.address }}</td>
              <td>
                <v-switch 
                    color="purple"
                    v-model="item.isActive" 
                    @change="changeState(item)">
                  </v-switch>
              </td>
            </template>
            <template v-slot:no-data>
              <v-alert :value="true" color="error" icon="warning">Sorry, nothing to display here :(</v-alert>
            </template>
          </v-data-table>
        </material-card>
      </v-flex>
    </v-layout>
  </v-container>
</template>

<script>
import axios from "axios";

export default {
  data() {
    return {
      salonDatatable: {
        search: "",
        headers: [
          {
            sortable: false,
            text: "Name",
            value: "name"
          },
          {
            sortable: false,
            text: "Phone",
            value: "phone"
          },
          {
            sortable: false,
            text: "Email",
            value: "email"
          },
          {
            sortable: false,
            text: "Address",
            value: "address"
          },
          {
            sortable: false,
            text: "Status",
            align: "left",
            value: "id"
          }
        ],
        salons: []
      }
    };
  },
  mounted() {
    this.initialize();
  },
  methods: {
    initialize() {
      let url = `${this.Domain}/api/adminsalon`;
      axios
        .get(url)
        .then(response => {
          if (response.data.length > 0) {
            response.data.forEach(ele => {
              let salon = {
                id: ele.SalonId,
                name: ele.SalonName,
                phone: ele.Phone,
                email: ele.Email,
                address: ele.Address,
                isActive: ele.IsActive
              };
              this.salonDatatable.salons.push(salon);
            });
          }
        })
        .catch(error => {
          console.log(error);
        });
    },
    closeSwal() {
      this.$swal.close();
    },
    changeState(item) {         
      console.log(item);

      let self = this; 
      this.$swal
        .fire({
          html: `Do you want to ${
            item.isActive == false ? "disable" : "enable"
          } this salon?`,
          type: "info",
          confirmButtonColor: "#3085d6",
          cancelButtonColor: "#d33",
          confirmButtonText: "Yes",
          cancelButtonText: "No",
          showCancelButton: true,
          reverseButtons: true
        })
        .then(result => {
          if (result.value) {
            let url = `${self.Domain}/api/adminsalon/updatestatus/${item.id}`;
            axios
              .post(url, {
                isActive: item.isActive
              }, 
              {
                headers: {
                'content-type': 'application/json',
                'data-type': 'json'
              }})               
              .then(response => {
                if (response.data.length > 0) {
                  if (response.success == true) {                    
                  } else {
                    item.isActive = !item.isActive;
                  }             
                  self.closeSwal();
                }
              })
              .catch(error => {
                  item.isActive = !item.isActive;
              });            
          } else {
            item.isActive = !item.isActive;
          }
        });
    },
    deleteItem(item) {
      let selectedSalon = Object.assign({}, item);
      console.log(selectedSalon.name);
      console.log(selectedSalon.phone);
      console.log(selectedSalon.address);
    }
  }
};
</script>

<style scoped>
  .v-table thead th{

  }
</style>