#include "types.h"
#include "defs.h"
#include "spinlock.h"
#include "param.h"
#include "semaphore.h"

struct semaphore sems[NSEM];

void semaphore_init(struct semaphore *sem, int value, char *name)
{
  sem->value = value;
  sem->wait_first = 0;
  sem->wait_last = 0;
  initlock(&sem->lk, "semaphore");
  memset(sem->waiting, 0, sizeof(sem->waiting));
  memset(sem->holding, 0, sizeof(sem->holding));
  sem->name = name;
}

void semaphore_acquire(struct semaphore *sem)
{
  acquire(&sem->lk);
  --sem->value;
  // cprintf("aqquire %s %d\n", sem->name, sem->value);
  if (sem->value < 0)
  {
    sem->waiting[sem->wait_last] = myproc();
    sem->wait_last = (sem->wait_last + 1) % NELEM(sem->waiting);
    sleep(sem, &sem->lk);
  }
  struct proc *p = myproc();
  for (int i = 0; i < NELEM(sem->holding); ++i)
  {
    if (sem->holding[i] == 0)
    {
      sem->holding[i] = p;
      break;
    }
  }
  release(&sem->lk);
}

void semaphore_release(struct semaphore *sem)
{
  acquire(&sem->lk);
  // cprintf("release %s %d\n", sem->name, sem->value);
  ++sem->value;
  if (sem->value <= 0)
  {
    wakeupproc(sem->waiting[sem->wait_first]);
    sem->waiting[sem->wait_first] = 0;
    sem->wait_first = (sem->wait_first + 1) % NELEM(sem->waiting);
  }
  struct proc *p = myproc();
  for (int i = 0; i < NELEM(sem->holding); ++i)
  {
    if (sem->holding[i] == p)
    {
      sem->holding[i] = 0;
      break;
    }
  }
  release(&sem->lk);
}

int semaphore_holding(struct semaphore *sem)
{
  struct proc *p = myproc();
  for (int i = 0; i < NELEM(sem->waiting); ++i)
  {
    if (sem->holding[i] == p)
    {
      return 1;
    }
  }
  return 0;
}

void sem_init(int id, int value, char *name)
{
  semaphore_init(&sems[id], value, name);
}

void sem_acquire(int id)
{
  semaphore_acquire(&sems[id]);
}

void sem_release(int id)
{
  semaphore_release(&sems[id]);
}