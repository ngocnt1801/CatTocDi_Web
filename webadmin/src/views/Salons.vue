<template>
  <v-container fill-height fluid grid-list-xl>
    <v-layout justify-center wrap>
      <v-flex md12>
        <material-card color="green" title="List of salons" text="Manage account of all salons">
          <v-card-title>
            <v-spacer></v-spacer>
            <v-text-field
              v-model="salonDatatable.search"
              append-icon="search"
              label="search"
              single-line
              hide-details
            ></v-text-field>
          </v-card-title>
          <v-data-table
            :headers="salonDatatable.headers"
            :items="salonDatatable.salons"
            :search="salonDatatable.search"
          >
            <template slot="headerCell" slot-scope="{ header }">
              <span
                class="subheading font-weight-light text-success text--darken-3"
                v-text="header.text"
              />
            </template>
            <template slot="items" slot-scope="{ item }">
              <td>{{ item.name }}</td>
              <td>{{ item.phone }}</td>
              <td>{{ item.email }}</td>
              <td>{{ item.address }}</td>
              <td class="justify-center layout px-0">
                <v-icon small class="mr-2" @click="editItem(item)">edit</v-icon>
                <v-icon small @click="deleteItem(item)">delete</v-icon>
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
            text: "Actions",
            align: "center",
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
      axios
        .get("http://192.168.1.24/cattocdi.webapi/api/adminsalon")
        .then(response => {
          if (response.data.length > 0) {
            response.data.forEach(ele => {
              let salon = {
                name: ele.SalonName,
                phone: ele.Phone,
                email: ele.Email,
                address: ele.Address
              };
              this.salonDatatable.salons.push(salon);
            });
          }
        })
        .catch(error => {
          console.log(error);
        });
    },
    editItem(item) {      
      let selectedSalon = Object.assign({}, item);
      console.log(selectedSalon.name);
      console.log(selectedSalon.phone);
      console.log(selectedSalon.address);
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
