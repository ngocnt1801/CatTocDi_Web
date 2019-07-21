<template>
  <v-container fill-height fluid grid-list-xl>
    <v-layout wrap>
      <v-flex md12 sm12 lg4>
        <material-chart-card
          :data="monthlySalonsChart.data"
          :options="monthlySalonsChart.options"
          :responsive-options="monthlyUsersChart.responsiveOptions"
          color="info"
          type="Bar"
        >
          <h4 class="title font-weight-light">Monthly Number of Salons</h4>
          <p class="category d-inline-flex font-weight-light">
            <v-icon color="green" small>mdi-arrow-up</v-icon>
            <span class="green--text">55%</span>&nbsp;
            increase in today's sales
          </p>

          <template slot="actions">
            <v-icon class="mr-2" small>mdi-clock-outline</v-icon>
            <span class="caption grey--text font-weight-light">updated 4 minutes ago</span>
          </template>
        </material-chart-card>
      </v-flex>
      <v-flex md12 sm12 lg4>
        <material-chart-card
          :data="monthlyUsersChart.data"
          :options="monthlyUsersChart.options"
          :responsive-options="monthlyUsersChart.responsiveOptions"
          color="red"
          type="Bar"
        >
          <h4 class="title font-weight-light">Monthly Number of Users</h4>
          <p class="category d-inline-flex font-weight-light">Last Campaign Performance</p>

          <template slot="actions">
            <v-icon class="mr-2" small>mdi-clock-outline</v-icon>
            <span class="caption grey--text font-weight-light">updated 10 minutes ago</span>
          </template>
        </material-chart-card>
      </v-flex>
      <v-flex md12 sm12 lg4>
        <material-chart-card
          :data="monthlyPromotionsChart.data"
          :options="monthlyPromotionsChart.options"
          color="green"
          type="Line"
        >
          <h3 class="title font-weight-light">Monthly Appointments</h3>
          <p class="category d-inline-flex font-weight-light">Last Last Campaign Performance</p>

          <template slot="actions">
            <v-icon class="mr-2" small>mdi-clock-outline</v-icon>
            <span class="caption grey--text font-weight-light">campaign sent 26 minutes ago</span>
          </template>
        </material-chart-card>
      </v-flex>
      <v-flex sm6 xs12 md6 lg3>
        <material-stats-card
          color="green"
          icon="store"
          title="Salons"
          v-bind:value="generalStatistic.totalSalons"
          sub-icon="mdi-calendar"
          sub-text="total salons"
        />
      </v-flex>
      <v-flex sm6 xs12 md6 lg3>
        <material-stats-card
          color="orange"
          icon="supervisor_account"
          title="Users"
          v-bind:value="generalStatistic.totalUsers"
          sub-icon="mdi-alert"
          sub-text="total users"
        />
      </v-flex>
      <v-flex sm6 xs12 md6 lg3>
        <material-stats-card
          color="red"
          icon="event"
          title="Appointments"
          v-bind:value="generalStatistic.totalAppointments"
          sub-icon="mdi-tag"
          sub-text="for all salons"
        />
      </v-flex>
      <v-flex sm6 xs12 md6 lg3>
        <material-stats-card
          color="info"
          icon="loyalty"
          title="Promotions"
          v-bind:value="generalStatistic.totalRunningPromotions"
          sub-icon="mdi-update"
          sub-text="running promotions"
        />
      </v-flex>
    </v-layout>
  </v-container>
</template>

<script>
import axios from "axios";
export default {
  data() {
    return {
      generalStatistic: {
        totalAppointments: 0,
        totalRunningPromotions: 0,
        totalSalons: 0,
        totalUsers: 0
      },
      monthlySalonsChart: {
        data: {
          labels: [],
          series: [[]]
        },
        options: {
          axisX: {
            showGrid: false
          },
          low: 0,
          high: 50,
          chartPadding: {
            top: 0,
            right: 5,
            bottom: 0,
            left: 0
          }
        },
        responsiveOptions: [
          [
            "screen and (max-width: 640px)",
            {
              seriesBarDistance: 5,
              axisX: {
                labelInterpolationFnc: function(value) {
                  return value[0];
                }
              }
            }
          ]
        ]
      },
      monthlyUsersChart: {
        data: {
          labels: [],
          series: [[]]
        },
        options: {
          axisX: {
            showGrid: false
          },
          low: 0,
          high: 50,
          chartPadding: {
            top: 0,
            right: 5,
            bottom: 0,
            left: 0
          }
        },
        responsiveOptions: [
          [
            "screen and (max-width: 640px)",
            {
              seriesBarDistance: 5,
              axisX: {
                labelInterpolationFnc: function(value) {
                  return value[0];
                }
              }
            }
          ]
        ]
      },
      monthlyPromotionsChart: {
        data: {
          labels: [],
          series: [[]]
        },
        options: {
          lineSmooth: this.$chartist.Interpolation.cardinal({
            tension: 0
          }),
          low: 0,
          high: 50, // creative tim: we recommend you to set the high sa the biggest value + something for a better look
          chartPadding: {
            top: 0,
            right: 0,
            bottom: 0,
            left: 0
          }
        }
      }
    };
  },
  mounted() {
    axios
      .get("http://localhost/cattocdi.webapi/api/statistic/2019")
      .then(response => {
        if (response.data) {
          let general = response.data.General;
          this.generalStatistic = {
            totalAppointments: general.TotalAppointments,
            totalRunningPromotions: general.TotalRunningPromotions,
            totalSalons: general.TotalSalons,
            totalUsers: general.TotalUsers
          };
          let salonsByMonth = response.data.SalonsByMonth;
          let usersByMonth = response.data.UsersByMonth;
          let apptByMonth = response.data.AppointmentsByMonth;

          salonsByMonth.forEach(ele => {
            this.monthlySalonsChart.data["labels"].push(ele.Month);
            this.monthlySalonsChart.data["series"][0].push(ele.Value);
          });

          usersByMonth.forEach(ele => {
            this.monthlyUsersChart.data["labels"].push(ele.Month);
            this.monthlyUsersChart.data["series"][0].push(ele.Value);
          });

          apptByMonth.forEach(ele => {
            this.monthlyPromotionsChart.data["labels"].push(ele.Month);
            this.monthlyPromotionsChart.data["series"][0].push(ele.Value);
          });
        }
      })
      .catch(error => {
        console.log(error);
      });
  },
  methods: {
    complete(index) {
      this.list[index] = !this.list[index];
    }
  }
};
</script>
