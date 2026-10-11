'use client'
import { useEffect, useState } from 'react'
import { supabase } from '@/lib/supabase'

export default function TaxCalendar() {
  const [taxes, setTaxes] = useState<any[]>([])

  useEffect(() => {
    supabase.from('tax_calendar').select('*').order('due_date').then(({data}) => setTaxes(data || []))
  }, [])

  const daysLeft = (date: string) => {
    const diff = Math.ceil((new Date(date).getTime() - new Date().getTime()) / (1000*60*60*24))
    return diff
  }

  return (
    <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
      {taxes.map(t => {
        const d = daysLeft(t.due_date)
        const color = d < 0 ? 'border-red-500' : d <= 3 ? 'border-yellow-400' : 'border-green-400'
        return (
          <div key={t.id} className={`bg-gray-900 p-4 rounded-xl border-l-4 ${color}`}>
            <h3 className="font-bold text-white">{t.tax_type}</h3>
            <p className="text-sm text-gray-400">Due: {t.due_date} • Siku {d} zimebaki</p>
            <p className="text-lg font-bold text-white mt-2">TZS {t.amount?.toLocaleString() || '0'}</p>
            <span className={`text-xs px-2 py-1 rounded ${t.status==='pending'?'bg-yellow-200':''}`}>{t.status}</span>
          </div>
        )
      })}
    </div>
  )
}
