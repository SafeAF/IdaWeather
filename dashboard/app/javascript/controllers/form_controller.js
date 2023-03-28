import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="form"

export default class extends Controller {
  static targets = ['startYear', 'endYear', 'year']
 

 
   connect() {
     this.updateFields()
   }
 
   updateFields() {
    console.log("foo")
    const yearField = document.querySelector('#yearField');
    console.log(yearField)

  yearField.style.display = 'none';

    const selectedOption = this.element.value
    console.log(selectedOption)
     if (selectedOption === 'Range_across_years') {
       this.startYearTarget.style.display = 'inline-block'
       this.endYearTarget.style.display = 'inline-block'
       this.yearTarget.style.display = 'none'
     } else if (selectedOption === 'Compare_one_month_across_years') {
       this.startYearTarget.style.display = 'none'
       this.endYearTarget.style.display = 'none'
       this.yearTarget.style.display = 'inline-block'
     } else if (selectedOption === 'Monthly_for_one_year') {
       this.startYearTarget.style.display = 'inline-block'
       this.endYearTarget.style.display = 'inline-block'
       this.yearTarget.style.display = 'none'
     } else if (selectedOption === 'Hourly_for_one_month_in_a_single_year') {
       this.startYearTarget.style.display = 'inline-block'
       this.endYearTarget.style.display = 'none'
       this.yearTarget.style.display = 'inline-block'
     }
   }

   toggle(){
    console.log("barrrr")
   
   }
}
 