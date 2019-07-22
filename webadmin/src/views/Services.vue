<template>
  <v-container grid-list-md text-xs-center>
    <v-layout row wrap>
      <v-flex md12>
        <v-card>
          <v-card-title>
            <v-layout row wrap>
              <v-flex md-4>
                <v-select
                  :items="categories"
                  v-model="selectedCategory"
                  v-on:change="chooseCategory"
                  item-text="name"
                  item-value="id"                  
                  label="Category"
                  color="purple"
                  return-object
                ></v-select>
              </v-flex>
              <v-flex md8 text-xs-right>
                <v-dialog v-model="dialog" max-width="500px">
                  <template v-slot:activator="{ on }">
                    <v-btn color="primary" dark class="mb-2" v-on="on">New Service</v-btn>
                  </template>
                  <v-card>
                    <v-card-title>
                      <span class="headline">{{ formTitle }}</span>
                    </v-card-title>

                    <v-card-text>
                      <v-container grid-list-md>
                        <v-layout wrap>
                          <v-flex xs12 sm6 md12>
                            <v-form ref="form">
                              <v-text-field
                                v-model="selectedCategory.name"
                                disabled
                                label="Category"
                              ></v-text-field>
                              <v-text-field
                                v-model="editedItem.serviceName"
                                label="Service Name"
                                :rules="nameRules"
                                required
                              ></v-text-field>
                            </v-form>
                          </v-flex>
                        </v-layout>
                      </v-container>
                    </v-card-text>

                    <v-card-actions>
                      <v-spacer></v-spacer>
                      <v-btn color="blue darken-1" flat @click="close">Cancel</v-btn>
                      <v-btn color="blue darken-1" flat @click="save">Save</v-btn>
                    </v-card-actions>
                  </v-card>
                </v-dialog>
              </v-flex>
              <v-flex md4 offset-md8>
                <v-text-field
                  v-model="serviceDatatable.search"
                  append-icon="search"
                  label="search"
                  color="purple"
                  single-line
                  hide-details
                ></v-text-field>
              </v-flex>
            </v-layout>
          </v-card-title>
          <v-flex md12>
            <v-data-table
              :headers="serviceDatatable.headers"
              :items="serviceDatatable.services"
              :search="serviceDatatable.search"
              class="elevation-1"
            >
              <template slot="headerCell" slot-scope="{ header }">
                <span
                  class="subheading font-weight-bold text--purple text--darken-3"
                  v-text="header.text"
                />
              </template>
              <template slot="items" slot-scope="{ item }">
                <td class="text-xs-left">{{ item.name }}</td>
                <td class="text-xs-center">{{ item.usedSalons }}</td>
                <td class="text-xs-center">{{ item.averagePrice }}</td>
              </template>
              <template v-slot:no-data>
                <v-alert
                  :value="true"
                  color="error"
                  icon="warning"
                >Sorry, nothing to display here :(</v-alert>
              </template>
            </v-data-table>
          </v-flex>
        </v-card>
      </v-flex>
    </v-layout>
  </v-container>
</template>

<script>
import axios from "axios";

export default {
  data: () => ({
    pagination: {},
    editedItem: {
      serviceName: ""
    },
    valid: true,
    nameRules: [
      v => !!v || "Name is required",
      v => (v && v.length <= 200) || "Name must be less than 200 characters"
    ],
    defaultItem: {
      serviceName: ""
    },
    editedIndex: -1,
    dialog: false,
    serviceDatatable: {
      search: "",
      headers: [
        {
          text: "Name",
          value: "name"
        },
        {
          text: "Used Salons",
          align: "center",
          value: "usedSalons"
        },
        {
          text: "Average Price",
          align: "center",
          value: "averagePrice"
        }
      ],
      services: []
    },
    selectedCategory: {},
    categories: []
  }),
  computed: {
    formTitle() {
      return this.editedIndex === -1 ? "New Service" : "Edit Item";
    }
  },
  watch: {
    dialog(val) {
      val || this.close();
    }
  },
  created() {
    this.initialize();
  },
  methods: {
    reloadAfterCreateService() {
      let self = this;
      let url = `${this.Domain}/api/admincategory`;
      axios
        .get(url)
        .then(response => {
          if (response.data.length > 0) {
            let selectedId = self.selectedCategory.id;
            self.categories = [];

            response.data.forEach(ele => {
              let category = {
                id: ele.CategoryId,
                name: ele.CategoryName,
                services: ele.Services.map(function(e) {
                  return {
                    id: e.ServiceId,
                    name: e.ServiceName,
                    usedSalons: e.AmountSalon,
                    averagePrice: e.AveragePrice
                  };
                })
              };              
              self.categories.push(category);
            });
            let selectedCategory = self.categories.filter(
              e => e.id == selectedId
            )[0];

            if (selectedCategory) {
              self.selectedCategory = selectedCategory;
              self.serviceDatatable.services = selectedCategory.services;
            }            
          }
        })
        .catch(error => {
          console.log(error);
        });
    },
    initialize() {
      let url = `${this.Domain}/api/admincategory`;
      axios
        .get(url)
        .then(response => {
          if (response.data.length > 0) {
            response.data.forEach(ele => {
              let category = {
                id: ele.CategoryId,
                name: ele.CategoryName,
                services: ele.Services.map(function(e) {
                  return {
                    id: e.ServiceId,
                    name: e.ServiceName,
                    usedSalons: e.AmountSalon,
                    averagePrice: e.AveragePrice
                  };
                })
              };
              this.categories.push(category);
            });
            this.selectedCategory = this.categories[0];
            this.defaultItem.categoryName = this.selectedCategory.name;
            this.serviceDatatable.services = this.selectedCategory.services;
          }
        })
        .catch(error => {
          console.log(error);
        });
    },
    chooseCategory(a) {
      this.serviceDatatable.services = a.services;
      this.selectedCategory = a;
    },
    close() {
      this.dialog = false;
      setTimeout(() => {
        this.editedItem = Object.assign({}, this.defaultItem);
        this.editedIndex = -1;
        this.resetValidation();
      }, 300);
    },

    save() {
      if (this.editedIndex > -1) {
      } else {
        if (this.validate()) {
          console.log(this.editedItem.serviceName);
          let self = this;
          let url = `${this.Domain}/api/adminservice`;
          axios
            .post(url, {
              ServiceName: this.editedItem.serviceName,
              CategoryId: this.selectedCategory.id
            })
            .then(function(response) {
              console.log(response);
              self.reloadAfterCreateService();
              self.close();
            })
            .catch(function(error) {
              console.log(error);
            });
        }
      }
    },
    validate() {
      if (this.$refs.form.validate()) {
        return true;
      }
      return false;
    },
    resetValidation() {
      this.$refs.form.resetValidation();
    }
  }
};
</script>
