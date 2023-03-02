output "cp_code_num" {
  description = "cp_code as number without cpc_ prefix"
  value       = tonumber(trim(akamai_cp_code.cp_code.id, "cpc_"))
}

output "cp_code" {
  description = "cp_code as string with cpc_ prefix"
  value       = akamai_cp_code.cp_code.id
}