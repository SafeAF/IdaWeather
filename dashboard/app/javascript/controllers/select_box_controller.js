import { Controller } from "@hotwired/stimulus"

// connects to data-controller select-box
export default class extends Controller {
 static targets = ['startYear', 'endYear', 'year']



  connect() {
    console.log("BAAAAAAA")
    this.updateFields()
  }
  updateFields() {
    const selectedOption = this.element.value

  
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

 toggle(event){
  const checkbox = event.target
  console.log(checkbox)
  const element = document.getElementById("foo")
  console.log(element)
  if (checkbox.checked) {
    element.style.display = 'block'
  } else {
    element.style.display = 'none'
  }
 }
}
